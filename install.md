```markdown
# 克隆 OpenModelica 仓库并构建

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
