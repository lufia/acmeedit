#!/usr/bin/env bash -l

export PLAN9="${PLAN9:-/usr/local/plan9}"
if ! echo :$PATH: | grep -q :$PLAN9/bin:
then
	PATH=$PATH:$PLAN9/bin
fi
export LESS=
export LESSCHARSET=utf-8

opts=()
if 9p ls font | grep -q GoRegular
then
	opts=("${opts[@]}" -f /mnt/font/GoRegular/14a/font)
fi
if 9p ls font | grep -q GoMono
then
	opts=("${opts[@]}" -F /mnt/font/GoMono/14a/font)
fi

if ! pgrep -q plumber
then
	plumber
	function cleanup() {
		pkill plumber
	}
else
	function cleanup() {
		:
	}
fi
trap 'cleanup; exit 1' 1 2 3 15

if pgrep -q acme
then
	for i in "$@"
	do
		plumb "$i"
	done
else
	acme "${opts[@]}" "$@"
fi
cleanup
