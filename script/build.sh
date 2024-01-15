#!/bin/bash

base_path=$(cd `dirname $0`; pwd)
root_path=$base_path/..
build_path=$root_path/build
build_type=$1

function build_uni_io() {
    if [[ ! -d "$build_path" ]]; then 
        echo "create cmake build.."
        mkdir -p $build_path
    fi
    cmake  -S$root_path       \
        -B$build_path -H$root_path          
    cmake --build $build_path --config $build_type
}

build_uni_io