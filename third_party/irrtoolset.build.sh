#! /bin/bash
# Builds IRRToolSet
set -ex

# Ensure git actually pulled all submodules
git submodule update --init --recursive

# Get the directory of the current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# CD into the source dir
cd "$DIR/irrtoolset"

# Build the project
autoreconf -i
./configure
make
make DESTDIR="$DIR/irrtoolset-bin" install