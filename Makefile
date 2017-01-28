TARG=Acme.app

STARTUP=main.scpt
EDITOR=acmeedit.bash
ICON=spaceglenda.icns

RES=$(TARG)/Contents/Resources

CONTENTS=\
	$(RES)/Scripts/$(STARTUP)\
	$(RES)/Scripts/$(EDITOR)\
	$(RES)/$(ICON)\

.PHONY: all clean

all: $(CONTENTS)

$(RES)/Scripts/$(STARTUP): $(STARTUP)
	osacompile -o $(TARG) $<

$(RES)/Scripts/%: %
	install -m 755 $< $@

$(RES)/$(ICON): $(ICON)
	cp $(ICON) $@
	plutil -replace CFBundleIconFile -string $< $(TARG)/Contents/Info.plist 

clean:
	rm -rf $(TARG)
