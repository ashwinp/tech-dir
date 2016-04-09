#!/bin/sh -xve

if [[ $# -ne 2 ]]; then
	echo "Expected 2 aruments (local dir name, commit message)"
	exit 1
fi

rm -f $1.tar.gz
rm -f $1.tar.gz.dat

tar cvzf $1.tar.gz $1
openssl enc -aes-256-cbc -in $1.tar.gz -out $1.tar.gz.dat
git add $1.tar.gz.dat
git commit -m "$2"
git push

rm -f $1.tar.gz
