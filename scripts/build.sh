#!/bin/bash
#generate typedoc into ./docs/build
./node_modules/.bin/typedoc ../src --options typedoc.json
#copy book.json into new build directory
cp ./book.json ../build/book.json
#copy style overrides into new build directory
cp -R ./theme/styles ./build/styles
#copy layout overrides into new build directory
cp -R ./theme/layouts ./build/layouts
#copy images into new build directory
cp -R ./theme/images ./build/images
#cd to ./docs/build where typedoc has already been generated and run gitbook install/build
cd ./theme/build && ./node_modules/.bin/gitbook install && ./node_modules/.bin/gitbook build .
