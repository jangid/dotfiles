all: elc install

OPTIONS = -Q -batch -L lisp -f batch-byte-compile
EMACS = /Users/pankaj/work/gnu/emacs/src/emacs

early-init.elc: early-init.el
	$(EMACS) $(OPTIONS) $<

elc: early-init.elc init.elc my-init.elc

init.elc: init.el
	$(EMACS) $(OPTIONS) $<

my-init.elc: my-init.el
	$(EMACS) $(OPTIONS) $<

install: early-init.el init.el
	$(EMACS) -Q -batch -l early-init.el -l init.el -f my-install-or-update
	touch install
clean:
	rm -rf early-init.elc init.elc my-init.elc install lisp/*.elc
