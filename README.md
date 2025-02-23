# OpenGL Setup with GLFW and GLAD

## Overview

This project demonstrates setting up OpenGL using **GLFW** and **GLAD** on **Windows 11** using **MinGW** and **VS Code**. It includes a basic OpenGL program that creates a window and renders a shape.

---

## **Prerequisites**

### 1. Install MinGW-w64 (GCC Compiler)

- Download: [https://winlibs.com/](https://winlibs.com/)
- Install and ensure `g++` is in your `PATH`:
  ```sh
  g++ --version
  ```
  If the output is an old version (e.g., `MinGW.org GCC-6.3.0`), update the `PATH` to point to the correct MinGW installation.

### 2. Install CMake (Optional for building GLFW)

- Download: [https://cmake.org/download/](https://cmake.org/download/)
- Ensure `cmake` is in your `PATH`:
  ```sh
  cmake --version
  ```

### 3. Install GLFW

- Download the precompiled Windows binaries: [https://www.glfw.org/download.html](https://www.glfw.org/download.html)
- Extract and copy:
  - `include/GLFW/` → `./include/GLFW/`
  - `lib-mingw-w64/libglfw3dll.a` → `./lib/`
  - `bin/glfw3.dll` → `./bin/`

### 4. Install GLAD

- Generate OpenGL loader: [https://glad.dav1d.de/](https://glad.dav1d.de/)
  - **API**: OpenGL
  - **Profile**: Core
  - **Version**: 4.6
  - **Language**: C/C++
- Extract and copy:
  - `glad.h` → `./include/glad/`
  - `glad.c` → `./src/`
  - `KHR/khrplatform.h` → `./include/KHR/`

---

## **Folder Structure**

```
/opengl_project
├── executables/
│   ├── main.exe  (after compilation)
│   ├── custom_program.exe (if compiled with different output name)
│
├── include/
│   ├── glad/
│   │   ├── glad.h
│   ├── KHR/
│   │   ├── khrplatform.h
│   ├── GLFW/
│       ├── glfw3.h
│       ├── glfw3native.h
│
├── lib/
│   ├── libglfw3dll.a
│
├── src/
│   ├── glad.c
│   ├── main.cpp
│
├── Makefile
```

---

## **Building and Running the Project**

### **1️⃣ Build the Project**

```sh
mingw32-make
```

This compiles `main.cpp` and `glad.c` into `executables/main.exe` and **automatically runs it**.

### **2️⃣ Custom Build Options**

Compile a **specific file**:

```sh
mingw32-make FILE_NAME=another_file.cpp
```

Change the **output name**:

```sh
mingw32-make OUTPUT_NAME=custom_program.exe
```

Pass **compilation flags** (e.g., optimizations, debugging):

```sh
mingw32-make CXXFLAGS="-O2 -Wall"
```

### **3️⃣ Cleaning the Executables**

Remove all compiled `.exe` files:

```sh
mingw32-make clean
```

---

## **Troubleshooting**

### 1. **MinGW Version Mismatch** (Inside VS Code vs. Terminal)

- Check which `g++` is being used in **VS Code Terminal**:
  ```sh
  where g++
  ```
- If `C:\MinGW\bin\g++.exe` appears instead of the correct version, update your **VS Code settings**:
  1. Open **Settings** (`Ctrl + ,` in VS Code)
  2. Search for `C_Cpp.default.compilerPath`
  3. Set it to the correct `g++.exe` path (e.g., `C:\msys64\mingw64\bin\g++.exe`)

### 2. **GLFW Header Not Found** (`GLFW/glfw3.h: No such file or directory`)

- Ensure your include folder structure is correct: `include/GLFW/glfw3.h`.
- Use the `-I` flag to specify the include directory in the Makefile.

### 3. **Linking Errors (Undefined Reference to GLFW Functions)**

- Ensure you are linking GLFW properly:
  ```sh
  g++ -Iinclude -Llib src/main.cpp src/glad.c -lglfw3dll -lopengl32 -o executables/main.exe
  ```
- If using `CMake`, try:
  ```sh
  cmake . && make
  ```

### 4. **Program Crashes on Startup**

- Ensure `glfw3.dll` is in the same directory as `main.exe` or in a system path.

---

## **Next Steps**

- Modify `default.cpp` to render shapes.
- Explore OpenGL shaders and textures.
- Optimize rendering performance.

For further questions, refer to:

- **GLFW Documentation**: [https://www.glfw.org/documentation.html](https://www.glfw.org/documentation.html)
- **OpenGL Tutorial**: [https://learnopengl.com/](https://learnopengl.com/)
