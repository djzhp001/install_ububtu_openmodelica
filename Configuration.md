# OpenModelica 安装和配置指南

本文档介绍如何在 Ubuntu 或 Debian 系统上安装 OpenModelica 并配置相关依赖。

## 安装步骤

以下是在您的系统上安装 OpenModelica 的步骤：

1. 更新软件包列表：

   ```bash
   sudo apt-get update
   ```

2. 安装必要的依赖：

   ```bash
   sudo apt-get install -y ca-certificates curl gnupg git
   ```

3. 下载 OpenModelica 的 GPG 密钥并保存：

   ```bash
   sudo curl -fsSL http://build.openmodelica.org/apt/openmodelica.asc | sudo gpg --dearmor -o /usr/share/keyrings/openmodelica-keyring.gpg
   ```

4. 添加 OpenModelica 软件源：

   ```bash
   echo "deb [arch=amd64 signed-by=/usr/share/keyrings/openmodelica-keyring.gpg] \
   https://build.openmodelica.org/apt \
   $(cat /etc/os-release | grep \"\\(UBUNTU\\|DEBIAN\\|VERSION\\)_CODENAME\" | sort | cut -d= -f 2 | head -1) \
   release" | sudo tee /etc/apt/sources.list.d/openmodelica.list
   ```

5. 更新软件包列表：

   ```bash
   sudo apt update
   ```

6. 安装 OpenModelica 及其库：

   ```bash
   sudo apt install -y openmodelica omlibrary libomccpp
   ```

7. 安装其他可能需要的依赖：

   ```bash
   sudo apt-get install -y ca-certificates curl gnupg lsb-release
   ```

8. 添加 OpenModelica 的夜间构建源：

   ```bash
   curl -fsSL http://build.openmodelica.org/apt/openmodelica.asc | sudo gpg --dearmor -o /usr/share/keyrings/openmodelica-keyring.gpg
   echo  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/openmodelica-keyring.gpg] https://build.openmodelica.org/apt \
   $(lsb_release -cs) nightly" | sudo tee /etc/apt/sources.list.d/openmodelica.list > /dev/null
   ```

9. 添加源代码的夜间构建源：

   ```bash
   echo  "deb-src [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/openmodelica-keyring.gpg] https://build.openmodelica.org/apt \
   nightly contrib" | sudo tee -a /etc/apt/sources.list.d/openmodelica.list > /dev/null
   ```

10. 显示导入的 GPG 密钥：

    ```bash
    gpg --show-keys /usr/share/keyrings/openmodelica-keyring.gpg
    ```

11. 更新软件包列表：

    ```bash
    sudo apt-get update
    ```

12. 安装 OpenModelica 编译依赖：

    ```bash
    sudo apt-get build-dep -y openmodelica
    ```

13. 安装其他可能需要的编译和构建依赖：

    ```bash
    sudo apt install -y autoconf automake libtool g++ gfortran clang cmake hwloc make ccache
    ```

## 贡献指南

欢迎对本项目进行贡献！如果您发现问题或有改进建议，请提交 issue 或者提出 pull 请求。

## 许可证

本项目采用 [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0) 进行许可。详细信息请参阅 [许可证文件](LICENSE)。 

