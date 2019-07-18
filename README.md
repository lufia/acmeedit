# acme packager

This repository contains a Makefile and several scripts for launch from Dock.

To make a package just run:

```
$ make
```

This command will create *Acme.app* in current directory.

## Requirements

*Acme.app* requires installed [Plan 9 from User Space](https://swtch.com/plan9port/) (a.k.a plan9port).
Also if plan9port is installed in different from _/usr/local/plan9_,
you should set _PLAN9_ environment variable with `launchctl`.

```
$ launchctl setenv PLAN9 ~/plan9
```

## Options

* GoFont
* 9fans.net/go/acme/editinacme
