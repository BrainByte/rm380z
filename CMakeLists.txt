cmake_minimum_required(VERSION 3.16)
project(rm380z)

set(CMAKE_CXX_STANDARD 17)

add_executable( rm380z main.cpp Screen.cpp Screen.h Memory.cpp Memory.h)

target_include_directories( rm380z PRIVATE /data/c-code/sfml/include )

target_link_libraries( rm380z
        /data/c-code/sfml/cmake-build-debug/lib/sfml-main-d.lib
        /data/c-code/sfml/cmake-build-debug/lib/sfml-window-d.lib
        /data/c-code/sfml/cmake-build-debug/lib/sfml-graphics-d.lib
        /data/c-code/sfml/cmake-build-debug/lib/sfml-system-d.lib
)
