#!/bin/bash

#####################################################################
# Project Name: install_ububtu_openmodelica
# Author: xudaojin
# Email: 52725351@qq.com
# Copyright (C) 2023-2028 xudaojin
# 
# Under the terms of the Apache License, Version 2.0 (hereinafter referred to as "License"),
# you are not allowed to use this file unless complying with the provisions of the License.
# You may obtain a copy of the License at: http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for specific language permissions and limitations. For questions, please contact the author for a copy of the License.
#####################################################################

# 更新系统软件包列表
sudo apt-get update

# 安装必要的依赖
sudo apt-get install -y ca-certificates curl gnupg git

# 下载OpenModelica的GPG密钥并保存
sudo curl -fsSL http://build.openmodelica.org/apt/openmodelica.asc | sudo gpg --dearmor -o /usr/share/keyrings/openmodelica-keyring.gpg

# 添加OpenModelica软件源
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/openmodelica-keyring.gpg] \
https://build.openmodelica.org/apt \
$(cat /etc/os-release | grep "\(UBUNTU\\|DEBIAN\\|VERSION\)_CODENAME" | sort | cut -d= -f 2 | head -1) \
release" | sudo tee /etc/apt/sources.list.d/openmodelica.list

# 更新软件包列表
sudo apt update

# 安装OpenModelica及其库
sudo apt install -y openmodelica omlibrary libomccpp

# 输出当前系统的版本代号
lsb_release --short --codename

# 安装其他可能需要的依赖
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# 添加OpenModelica的夜间构建源
curl -fsSL http://build.openmodelica.org/apt/openmodelica.asc | sudo gpg --dearmor -o /usr/share/keyrings/openmodelica-keyring.gpg
echo  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/openmodelica-keyring.gpg] https://build.openmodelica.org/apt \
$(lsb_release -cs) nightly" | sudo tee /etc/apt/sources.list.d/openmodelica.list > /dev/null

# 添加源代码的夜间构建源
echo  "deb-src [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/openmodelica-keyring.gpg] https://build.openmodelica.org/apt \
nightly contrib" | sudo tee -a /etc/apt/sources.list.d/openmodelica.list > /dev/null

# 显示导入的GPG密钥
gpg --show-keys /usr/share/keyrings/openmodelica-keyring.gpg

# 更新软件包列表
sudo apt-get update

# 安装OpenModelica编译依赖
sudo apt-get build-dep -y openmodelica

# 安装其他可能需要的编译和构建依赖
sudo apt install -y autoconf automake libtool g++ gfortran clang cmake hwloc make ccache

