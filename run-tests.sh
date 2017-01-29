#!/bin/bash

TESTS=(
    "4_2"
    "5_0"
    "5_1"
    "5_2"
    "5_3"
    "5_4"
)

if [ ! -z $1 ]; then
    TESTS=($1)
fi

# gem install capistrano-laravel

for test in ${TESTS[@]}; do
    pushd laravel/${test}
        rm -rf deploy/{current,releases,repo,shared,revision.log}
        cap --trace test deploy
    popd
done
