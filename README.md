# 安装 OpenModelica 指南

以下是在您的系统上安装 OpenModelica 的步骤：

## 更新软件包列表

```bash
sudo apt-get update
```

## 安装必要的依赖

```bash
sudo apt-get install -y ca-certificates curl gnupg git
```

## 下载 OpenModelica 的 GPG 密钥并保存

```bash
sudo curl -fsSL http://build.openmodelica.org/apt/openmodelica.asc | sudo gpg --dearmor -o /usr/share/keyrings/openmodelica-keyring.gpg
```

## 添加 OpenModelica 软件源

```bash
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/openmodelica-keyring.gpg] \
https://build.openmodelica.org/apt \
$(cat /etc/os-release | grep \"\\(UBUNTU\\|DEBIAN\\|VERSION\\)_CODENAME\" | sort | cut -d= -f 2 | head -1) \
release" | sudo tee /etc/apt/sources.list.d/openmodelica.list
```

## 更新软件包列表

```bash
sudo apt update
```

## 安装 OpenModelica 及其库

```bash
sudo apt install -y openmodelica omlibrary libomccpp
```

## 安装其他可能需要的依赖

```bash
sudo apt-get install -y ca-certificates curl gnupg lsb-release
```

## 添加 OpenModelica 的构建源

```bash
curl -fsSL http://build.openmodelica.org/apt/openmodelica.asc | sudo gpg --dearmor -o /usr/share/keyrings/openmodelica-keyring.gpg
echo  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/openmodelica-keyring.gpg] https://build.openmodelica.org/apt \
$(lsb_release -cs) nightly" | sudo tee /etc/apt/sources.list.d/openmodelica.list > /dev/null
```

## 添加源代码的构建源

```bash
echo  "deb-src [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/openmodelica-keyring.gpg] https://build.openmodelica.org/apt \
nightly contrib" | sudo tee -a /etc/apt/sources.list.d/openmodelica.list > /dev/null
```

## 显示导入的 GPG 密钥

```bash
gpg --show-keys /usr/share/keyrings/openmodelica-keyring.gpg
```

## 更新软件包列表

```bash
sudo apt-get update
```

## 安装 OpenModelica 编译依赖

```bash
sudo apt-get build-dep -y openmodelica
```

## 安装其他可能需要的编译和构建依赖

```bash
sudo apt install -y autoconf automake libtool g++ gfortran clang cmake hwloc make ccache
```

## 克隆 OpenModelica 仓库并构建

以下是在克隆 OpenModelica 仓库并构建的步骤：

1. 克隆 OpenModelica 仓库，包括子模块：

   ```bash
   git clone --recurse-submodules https://github.com/OpenModelica/OpenModelica.git
   ```

2. 进入 OpenModelica 目录：

   ```bash
   cd OpenModelica
   ```

3. 切换到 v1.20.0 版本：

   ```bash
   git checkout v1.20.0
   ```

4. 更新子模块：

   ```bash
   git submodule update --force --init --recursive
   ```

5. 使用 CMake 生成构建文件：

   ```bash
   cmake -S . -B build_cmake
   ```

6. 编译和安装 OpenModelica（将 `<核心数>` 替换为您的 CPU 核心数，默认设置为 4）：

   ```bash
   cmake --build build_cmake --parallel 4 --target install
   ```

请注意，这些步骤会将 OpenModelica 仓库克隆到本地，并使用 CMake 构建和安装它。确保您按照指南中的步骤执行，并根据需要调整核心数参数。

## 安装 OpenModelica 所需的 Ubuntu 依赖

1. 使用以下命令给脚本文件添加执行权限：

   ```bash
   chmod +x install_openmodelica.sh
   ```

2. 运行脚本文件以安装 OpenModelica 所需的 Ubuntu 依赖：

   ```bash
   ./install_openmodelica.sh
   ```

该脚本将帮助您安装 OpenModelica 运行所需的 Ubuntu 依赖。

## 安装 OpenModelica 软件（install_openmodelica2.sh）

1. 使用以下命令给脚本文件添加执行权限：

   ```bash
   chmod +x install_openmodelica2.sh
   ```

2. 运行脚本文件以安装 OpenModelica 软件：

   ```bash
   ./install_openmodelica2.sh
   ```

3. 安装 OpenModelica 软件注意需知：

   ```bash
   梯子 梯子 网络不行 说什么都没有用
   ```

4. 使用中遇到任何问题联系开发者：

<img src="https://github.com/djzhp001/install_ububtu_openmodelica/assets/143991527/389c15f5-cf27-47dd-9750-dd17ee1ff84c" alt="OpenModelica Logo" width="300" height="400">



该脚本将帮助您安装 OpenModelica 软件本身。
## 贡献指南

欢迎对本项目进行贡献！如果您发现问题或有改进建议，请提交 issue 或者提出 pull 请求。

## 许可证

本项目采用 [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0) 进行许可。详细信息请参阅 [许可证文件](LICENSE)。 
