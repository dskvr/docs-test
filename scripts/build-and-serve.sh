#!/bin/bash
PATH_SOURCE=${1-"./src"}
PATH_DOCS=${2-"./docs"}
PATH_BUILD=${3-$PATH_DOCS/build}
PATH_DOC_UTIL=${4-$PATH_DOCS/eosio-docs}

sh ./build.sh $PATH_SOURCE $PATH_DOCS $PATH_BUILD $PATH_DOC_UTIL
sh ./scripts/serve.sh $PATH_BUILD
