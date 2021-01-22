all: elc install

OPTIONS = -Q -batch -L lisp -f batch-byte-compile
EMACS = /Users/pankaj/work/gnu/emacs/src/emacs

elc: early-init.elc init.elc

early-init.elc: early-init.el
	$(EMACS) $(OPTIONS) $<

init.elc: init.el my-init.elc lisp/my-util.elc
	$(EMACS) $(OPTIONS) $<

my-init.elc: my-init.el
	$(EMACS) $(OPTIONS) $<

lisp/my-util.elc: lisp/my-util.el
	$(EMACS) $(OPTIONS) $<

install: early-init.el init.el my-init.el lisp/my-util.el
	$(EMACS) -Q -batch -l early-init.el -l init.el -f my-install-or-update
	touch install

clean:
	rm -rf early-init.elc init.elc my-init.elc install lisp/*.elc
