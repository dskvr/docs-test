#!/bin/bash
# -- /path/to/src
if test -z '$1'
then
  PATH_SRC = $1
else
  PATH_SRC = "../../src"
fi

if test -z '$2'
then
  PATH_ROOT = $2
else
  PATH_DOC_ROOT = ".."
fi

#generate typedoc into ./docs/build
./node_modules/.bin/typedoc $PATH --options typedoc.json
#copy book.json into new build directory
cp ./book.json $PATH/build/book.json
#copy style overrides into new build directory
cp -R ./theme/styles $PATH/build/styles
#copy layout overrides into new build directory
cp -R ./theme/layouts $PATH/build/layouts
#copy images into new build directory
cp -R ./theme/images $PATH/build/images
#cd to ./docs/build where typedoc has already been generated and run gitbook install/build
cd ./theme/build && ./node_modules/.bin/gitbook install && ./node_modules/.bin/gitbook build .
