CXX = g++
CXXFLAGS = --std=c++17 -w -O3
SOURCES = pocket_3d_distance.cpp pocket_extraction_sequence.cpp
OBJECTS = $(SOURCES:.cpp=.o)
TARGET1 = pocket_3d_distance
TARGET2 = pocket_extraction_sequence
default: all

all: 
	$(CXX) $(CXXFLAGS) -o $(TARGET1) pocket_3d_distance.cpp
	$(CXX) $(CXXFLAGS) -o $(TARGET2) pocket_extraction_sequence.cpp
