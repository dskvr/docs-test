#!/bin/bash
if test -z '$1'
then
  PATH_ROOT=$1
else
  PATH_ROOT=".."
fi

if test -z '$2'
then
  PATH_RPO=$2
else
  PATH_SRC="/src"
fi

if test -z '$3'
then
  PATH_DOC=$3
else
  PATH_DOC="/docs"
fi

sh ./build.sh
sh ./scripts/serve.sh
