if test -z '$1'
then
  PATH_DOCS=$1
else
  PATH_DOCS="./docs/eosio-docs"
fi

if test -z '$2'
then
  PATH_SOURCE=$2
else
  PATH_SOURCE="./src"
fi

if test -z '$3'
then
  PATH_BUILD=$3
else
  PATH_BUILD="./docs/build"
fi

#generate typedoc into ./docs/build
./node_modules/.bin/typedoc $PATH_SOURCE --options typedoc.json
#copy book.json into new build directory
cp $PATH_DOCS/book.json $PATH_BUILD/book.json
#copy style overrides into new build directory
cp -R $PATH_DOCS/theme/styles $PATH_BUILD/styles
#copy layout overrides into new build directory
cp -R $PATH_DOCS/theme/layouts $PATH_BUILD/layouts
#copy images into new build directory
cp -R $PATH_DOCS/theme/images $PATH_BUILD/images
cp -a $PATH_DOCS/static/. $PATH_BUILD/
#cd to ./docs/build where typedoc has already been generated and run gitbook install/build
cd $PATH_BUILD && ./node_modules/.bin/gitbook install && ./node_modules/.bin/gitbook build .
