# Compiler
CXX := g++

# Directories
SRC_DIR := src
BIN_DIR := bin
INCLUDE_DIR := include
LIB_DIR := lib

# Default filenames
SRC_FILE ?= main.cpp
OUT_FILE ?= out.exe

# Compilation flags
CXXFLAGS := -I$(INCLUDE_DIR) -L$(LIB_DIR) -lglfw3 -lopengl32

# Ensure bin directory exists
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Build rule
$(BIN_DIR)/$(OUT_FILE): $(SRC_DIR)/$(SRC_FILE) $(SRC_DIR)/glad.c | $(BIN_DIR)
	$(CXX) $(SRC_DIR)/$(SRC_FILE) $(SRC_DIR)/glad.c -o $(BIN_DIR)/$(OUT_FILE) $(CXXFLAGS)

# Default target
all: $(BIN_DIR)/$(OUT_FILE)

# Clean rule
clean:
	rm -rf $(BIN_DIR)/*.exe
