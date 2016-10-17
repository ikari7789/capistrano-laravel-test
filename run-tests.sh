#!/bin/sh

TESTS=(
    4.2
    5.0
    5.1
    5.2
    5.3
)

if [ ! -z $1 ]; then
    TESTS=($1)
fi

# gem install capistrano-laravel

for test in ${TESTS[@]}; do
    pushd ${test}
        rm -rf deploy/{current,releases,repo,shared,revision.log}
        cap test deploy
    popd
done
