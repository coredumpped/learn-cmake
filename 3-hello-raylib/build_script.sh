#!/usr/bin/env bash
mkdir build 
cd build 
Important! 
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .. 
cmake --build . --parallel
