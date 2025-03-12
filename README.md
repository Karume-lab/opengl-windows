# **OpenGL Setup with GLFW and GLAD**

## **Overview**

This project sets up OpenGL using **GLFW** and **GLAD** on **Windows 11** with **MinGW-w64** and **VS Code**. It includes a basic OpenGL program that creates a window and renders a white triangle.

---

## **Prerequisites**

### **1️⃣ Install MinGW-w64 (GCC Compiler)**

📥 **Download**: [WinLibs MinGW-w64](https://winlibs.com/)

📌 Verify installation:

```sh
g++ --version
```

If the output shows an old version (e.g., **GCC-6.3.0**), update your `PATH` to point to the correct MinGW installation.

---

### **2️⃣ Install CMake (Optional for Building GLFW)**

📥 **Download**: [CMake Official Site](https://cmake.org/download/)

📌 Verify installation:

```sh
cmake --version
```

---

### **3️⃣ Install GLFW**

1. 📥 **Download GLFW precompiled binaries**: [GLFW Download](https://www.glfw.org/download.html)
2. Extract and copy:
   ```
   include/GLFW/ → ./include/GLFW/
   lib-mingw-w64/libglfw3dll.a → ./lib/
   bin/glfw3.dll → ./bin/
   ```

---

### **4️⃣ Install GLAD**

1. **Generate OpenGL loader**: [GLAD Generator](https://glad.dav1d.de/)
   - **API**: OpenGL
   - **Profile**: Core
   - **Version**: 4.6
   - **Language**: C/C++
2. Extract and copy:
   ```
   glad.h → ./include/glad/
   glad.c → ./src/
   KHR/khrplatform.h → ./include/KHR/
   ```

---

## **Building and Running the Project**

### **1️⃣ Build the Project**

```sh
make
```

This compiles `main.cpp` and `glad.c` into `bin/OpenGLApp.exe`.

---

### **2️⃣ Custom Build Options**

📝 **Compile a specific file**:

```sh
make SRC_FILE=triangle.cpp OUT_FILE=triangle.exe
```

📝 **Change the output name**:

```sh
make OUT_FILE=custom_program.exe
```

📝 **Pass compilation flags (e.g., optimizations, debugging)**:

```sh
make CXXFLAGS="-O2 -Wall"
```

---

### **3️⃣ Cleaning the Executables**

```sh
make clean
```

This removes all compiled `.exe` files from `bin/`.

---

## **Troubleshooting**

### **1️⃣ MinGW Version Mismatch (Inside VS Code vs. Terminal)**

Check which `g++` is being used:

```sh
where g++
```

If `C:\MinGW\bin\g++.exe` appears instead of `C:\msys64\mingw64\bin\g++.exe`, update your **VS Code settings**:

1. Open **Settings** (`Ctrl + ,` in VS Code)
2. Search for `C_Cpp.default.compilerPath`
3. Set it to:
   ```
   C:\msys64\mingw64\bin\g++.exe
   ```

---

### **2️⃣ GLFW Header Not Found (`GLFW/glfw3.h: No such file or directory`)**

✅ Ensure your include folder structure is correct: `include/GLFW/glfw3.h`.  
✅ Use the `-I` flag to specify the include directory in the `Makefile`.

---

### **3️⃣ Linking Errors (`Undefined Reference to GLFW Functions`)**

Ensure you are linking GLFW properly:

```sh
g++ -Iinclude -Llib src/main.cpp src/glad.c -lglfw3 -lopengl32 -o bin/OpenGLApp.exe
```

If using CMake:

```sh
cmake . && make
```

---

### **4️⃣ Program Crashes on Startup**

✅ Ensure `glfw3.dll` is in the **same directory** as `OpenGLApp.exe` or in a system path.

---

📚 **References**

- [GLFW Documentation](https://www.glfw.org/documentation.html)
- [OpenGL Tutorial](https://learnopengl.com/)
