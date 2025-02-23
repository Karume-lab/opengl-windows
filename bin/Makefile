# Base directories
INPUT_BASE_DIR ?= ../src
OUTPUT_BASE_DIR ?= ./executables

# Default filenames
FILE_NAME ?= default.cpp
OUTPUT_NAME ?= default.exe

# Compiler and flags
CXX := g++
CXXFLAGS := -g --std=c++17 -I../include -L../lib
LIBS := -lglfw3dll -lopengl32

# Construct full paths
SOURCES := $(INPUT_BASE_DIR)/$(FILE_NAME) $(INPUT_BASE_DIR)/glad.c
OUTPUT := $(OUTPUT_BASE_DIR)/$(OUTPUT_NAME)

all: create_output_dir
	$(CXX) $(CXXFLAGS) $(SOURCES) $(LIBS) -o $(OUTPUT) && $(OUTPUT)

# Ensure output directory exists before compilation
create_output_dir:
	mkdir -p $(OUTPUT_BASE_DIR)

clean:
	rm -rf $(OUTPUT_BASE_DIR)/*.exe
