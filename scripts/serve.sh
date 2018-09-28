#!/bin/bash
# -- /path/to/src
if test -z '$1'
then
  PATH_ROOT=$1
else
  PATH_ROOT="../.."
fi

if test -z '$2'
then
  PATH_DOC=$3
else
  PATH_DOC="/docs"
fi

PATH_BUILD=$PATH_ROOT$PATHDOC/build

./node_modules/.bin/gitbook serve $PATH_BUILD
