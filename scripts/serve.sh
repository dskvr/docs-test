if test -z '$2'
then
  PATH_BUILD = $2
else
  PATH_BUILD = "../build"
fi

./node_modules/.bin/gitbook serve $PATH_BUILD
