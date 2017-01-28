#!/usr/bin/env bash

export PLAN9="${PLAN9:-/usr/local/plan9}"
if ! echo :$PATH: | grep -q :$PLAN9/bin:
then
	PATH=$PATH:$PLAN9/bin
fi

exec acme "$@"
