all: early-init.elc init.elc my-init.elc install

OPTIONS = -Q -batch -L lisp -f batch-byte-compile
EMACS = /Users/pankaj/work/code/savannah/emacs/src/emacs

early-init.elc: early-init.el
	$(EMACS) $(OPTIONS) $<

init.elc: init.el \
	lisp/init-keys.elc \
	lisp/init-looks.elc \
	lisp/init-email.elc \
	lisp/init-erc.elc \
	lisp/init-diary.elc \
	lisp/init-session.elc \
	lisp/init-website.elc \
	lisp/init-flymake.elc \
	lisp/init-elisp.elc \
	lisp/init-python.elc \
	lisp/init-org.elc \
	lisp/init-java.elc \
	lisp/init-js.elc \
	lisp/init-ruby.elc
	$(EMACS) $(OPTIONS) $<

my-init.elc: my-init.el
	$(EMACS) $(OPTIONS) $<

install: early-init.el init.el
	$(EMACS) -Q -batch -l early-init.el -l init.el -f my-install-or-update
	touch install

lisp/init-keys.elc: lisp/init-keys.el
	$(EMACS) $(OPTIONS) $<

lisp/init-session.elc: lisp/init-session.el
	$(EMACS) $(OPTIONS) $<

lisp/init-python.elc: lisp/init-python.el
	$(EMACS) $(OPTIONS) $<

lisp/init-ruby.elc: lisp/init-ruby.el
	$(EMACS) $(OPTIONS) $<

lisp/init-js.elc: lisp/init-js.el
	$(EMACS) $(OPTIONS) $<

lisp/init-java.elc: lisp/init-java.el
	$(EMACS) $(OPTIONS) $<

lisp/init-org.elc: lisp/init-org.el
	$(EMACS) $(OPTIONS) $<

lisp/init-email.elc: lisp/init-email.el
	$(EMACS) $(OPTIONS) $<

lisp/init-erc.elc: lisp/init-erc.el
	$(EMACS) $(OPTIONS) $<

lisp/init-diary.elc: lisp/init-diary.el
	$(EMACS) $(OPTIONS) $<

lisp/init-recentf.elc: lisp/init-recentf.el
	$(EMACS) $(OPTIONS) $<

lisp/init-website.elc: lisp/init-website.el
	$(EMACS) $(OPTIONS) $<

lisp/init-looks.elc: lisp/init-looks.el
	$(EMACS) $(OPTIONS) $<

lisp/init-elisp.elc: lisp/init-elisp.el
	$(EMACS) $(OPTIONS) $<

lisp/init-flymake.elc: lisp/init-flymake.el
	$(EMACS) $(OPTIONS) $<

clean:
	rm -rf early-init.elc init.elc my-init.elc install lisp/*.elc
