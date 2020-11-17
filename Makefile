# An extremely conveinient, simple makefile for small projects.
# Does not actually rebuild efficienly based on dependencies.

CC := g++
LD := g++

CFLAGS := -c -std=c++17 -pedantic-errors -Wall
LFLAGS := -g

# Add driver cpp files without the file extension.
DRIVERS := main
DRIVER_EXES := $(addsuffix .exe, $(DRIVERS))
DRIVER_DEBUG_EXES := $(addsuffix _debug.exe, $(DRIVERS))

DRIVER_SOURCES := $(addsuffix .cpp, $(DRIVERS))
HELPER_SOURCES := $(wildcard *.cpp)
HELPER_SOURCES := $(filter-out $(DRIVER_SOURCES), $(HELPER_SOURCES))

HELPER_OBJECTS	:= $(HELPER_SOURCES:%.cpp=%.o)

release: CFLAGS += -O3 -DNDEBUG
release: $(DRIVER_EXES)

debug: CFLAGS += -g -Wconversion -Werror -Wextra -pedantic -Wignored-qualifiers -DDEBUG
debug: $(DRIVER_DEBUG_EXES)

%.o: %.cpp
	$(CC) $(CFLAGS) $*.cpp

%.exe: %.o $(HELPER_OBJECTS)
	$(LD) $(LFLAGS) $*.o $(HELPER_OBJECTS) -o $*.exe

%_debug.exe: %.o $(HELPER_OBJECTS)
	$(LD) $(LFLAGS) $*.o $(HELPER_OBJECTS) -o $*_debug.exe

clean:
	rm -f $(DRIVER_EXES) $(DRIVER_DEBUG_EXES) *.o
