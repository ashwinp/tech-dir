#!/bin/sh -xve

if [[ $# -ne 1 ]]; then
        echo "Expected 1 arument (local dir name)"
        exit 1
fi

git pull
openssl enc -aes-256-cbc -d -in $1.tar.gz.dat > $1.tar.gz
tar xvzf $1.tar.gz

rm -f $1.tar.gz
