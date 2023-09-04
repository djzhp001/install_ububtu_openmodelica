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


# 克隆 OpenModelica 的仓库
git clone --recurse-submodules https://github.com/OpenModelica/OpenModelica.git

# 进入 OpenModelica 目录
cd OpenModelica

# 切换到 v1.20.0 版本
git checkout v1.20.0

# 更新子模块
git submodule update --force --init --recursive

# 使用 CMake 生成构建文件
cmake -S . -B build_cmake

# 编译和安装（替换 <Nr. of cores> 为您的 CPU 核心数 默认设置的是4 ）
cmake --build build_cmake --parallel 4 --target install
