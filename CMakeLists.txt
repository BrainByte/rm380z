cmake_minimum_required(VERSION 3.16)
project( rm380z )

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++")
set(SFML_STATIC_LIBRARIES TRUE)

add_executable( rm380z
        src/cpu/clk.h
        src/cpu/kbd.h
        src/cpu/mem.h
        src/cpu/z80.h
        src/cpu/z80ctc.h
        src/cpu/z80pio.h
        src/memory/simple-mem.h
        src/memory/simple-mem.cpp
        src/screen/Screen.cpp
        src/screen/Screen.h
        src/memory/Memory.cpp
        src/memory/Memory.h
        src/processor/Processor.cpp
        src/processor/Processor.h
        src/rm380z.cpp
        src/system/Timer.cpp
        src/system/Timer.h
        src/system/System.cpp
        src/system/System.h
)

target_include_directories( rm380z PRIVATE C:/data/c-code/SFML/include )

target_link_libraries( rm380z
        ${CMAKE_SOURCE_DIR}/libs/libsfml-main-d.a
        ${CMAKE_SOURCE_DIR}/libs/libsfml-window-d.a
        ${CMAKE_SOURCE_DIR}/libs/libsfml-graphics-d.a
        ${CMAKE_SOURCE_DIR}/libs/libsfml-system-d.a
)
