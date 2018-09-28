# If there are implementation issues due to non-compliance of patterns, pass in relative paths (from root of typescript project) as positionals.

if test -z '$1'
then
  PATH_SOURCE=$1
else
  PATH_SOURCE=./src
fi

if test -z '$2'
then
  PATH_DOCS=$2
else
  PATH_DOCS=./docs
fi

if test -z '$3'
then
  PATH_BUILD=$3
else
  PATH_BUILD=$PATH_DOCS/build
fi

if test -z '$4'
then
  PATH_DOC_UTIL=$4
else
  PATH_DOC_UTIL=$PATH_DOCS/eosio-docs
fi


#generate typedoc into ./docs/build
./node_modules/.bin/typedoc $PATH_SOURCE --options typedoc.json
#copy book.json into new build directory
cp $PATH_DOC_UTIL/book.json $PATH_BUILD/book.json
#copy style overrides into new build directory
cp -R $PATH_DOC_UTIL/theme/styles $PATH_BUILD/styles
#copy layout overrides into new build directory
cp -R $PATH_DOC_UTIL/theme/layout $PATH_BUILD/layout
#copy images into new build directory
cp -R $PATH_DOC_UTIL/theme/images $PATH_BUILD/images
cp -a ./docs/static/. $PATH_BUILD/

#cd to ./docs/build where typedoc has already been generated and run gitbook install/build
cd $PATH_BUILD && ../../node_modules/.bin/gitbook install

cd ../.. && ./node_modules/.bin/gitbook build $PATH_BUILD
