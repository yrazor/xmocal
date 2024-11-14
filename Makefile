# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Iinclude -I/usr/include/qt -I/usr/include/qt/QtWidgets
LDFLAGS = -L/usr/lib -lQt6Widgets -lQt6Core -lQt6Gui

# Project structure
SRC_DIR = src
BUILD_DIR = build
INCLUDE_DIR = include
TARGET = my_qt_app

# Source files and object files
SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRC_FILES))

# Default target
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJ_FILES)
	$(CXX) $(OBJ_FILES) -o $@ $(LDFLAGS)

# Compile each source file into an object file
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create the build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Clean up build files
clean:
	rm -rf $(BUILD_DIR) $(TARGET)

