#!/usr/bin/env bash

export CXXFLAGS="${CXXFLAGS} -std=c++14"

./configure \
    --prefix="${PREFIX}"  \
    --enable-libxml2-backend

make -j${CPU_COUNT}
make install

pushd tools
make -j${CPU_COUNT}
make install
popd

make check
