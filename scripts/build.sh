PATH_BUILD=./build
PATH_THEME=./theme
PATH_STATIC=./static
PATH_ROOT=../..

PATH_SOURCE=$PATH_ROOT/src

#generate typedoc into ./docs/build
./node_modules/.bin/typedoc $PATH_SRC --options ../../typedoc.json
#copy book.json into new build directory
cp ./book.json ./book.json
#copy style overrides into new build directory
cp -R $PATH_THEME/styles $PATH_BUILD/styles
#copy layout overrides into new build directory
cp -R $PATH_THEME/layouts $PATH_BUILD/layouts
#copy images into new build directory
cp -R $PATH_THEME/images $PATH_BUILD/images
#cd to ./docs/build where typedoc has already been generated and run gitbook install/build
cd $PATH_BUILD && ./node_modules/.bin/gitbook install && ./node_modules/.bin/gitbook build .
