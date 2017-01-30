TARG=Acme.app

STARTUP=main.scpt
EDITOR=acmeedit.bash
ICON=spaceglenda.icns

RES=$(TARG)/Contents/Resources
PLIST=$(TARG)/Contents/Info.plist

CONTENTS=\
	$(RES)/Scripts/$(STARTUP)\
	$(RES)/Scripts/$(EDITOR)\
	$(RES)/$(ICON)\

.PHONY: all clean

all: $(CONTENTS)

$(RES)/Scripts/$(STARTUP): $(STARTUP)
	osacompile -o $(TARG) $<
	plutil -replace CFBundleDocumentTypes.CFBundleTypeRole -string Editor $(PLIST)

$(RES)/Scripts/%: %
	install -m 755 $< $@

$(RES)/$(ICON): $(ICON)
	cp $< $@
	plutil -replace CFBundleIconFile -string $< $(PLIST)
	rm -f $(RES)/droplet.icns

clean:
	rm -rf $(TARG)
