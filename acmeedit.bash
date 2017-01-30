#!/usr/bin/env bash

export PLAN9="${PLAN9:-/usr/local/plan9}"
if ! echo :$PATH: | grep -q :$PLAN9/bin:
then
	PATH=$PATH:$PLAN9/bin
fi

opts=()
if 9p ls font | grep -q GoRegular
then
	opts=("${opts[@]}" -f /mnt/font/GoRegular/14a/font)
fi
if 9p ls font | grep -q GoMono
then
	opts=("${opts[@]}" -F /mnt/font/GoMono/14a/font)
fi

acme "${opts[@]}" "$@"
