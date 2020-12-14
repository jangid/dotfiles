all: early-init.elc init.elc

OPTIONS = -Q -batch -L lisp -f batch-byte-compile

early-init.elc: early-init.el
	emacs $(OPTIONS) $<

init.elc: init.el \
	lisp/init-keys.elc \
	lisp/init-auth.elc \
	lisp/init-ibuffer.elc \
	lisp/init-email.elc \
	lisp/init-erc.elc \
	lisp/init-completion.elc \
	lisp/init-browser.elc \
	lisp/init-date-time.elc \
	lisp/init-diary.elc \
	lisp/init-recentf.elc \
	lisp/init-cedet.elc \
	lisp/init-speedbar.elc \
	lisp/init-website.elc \
	lisp/init-dired.elc \
	lisp/init-looks.elc \
	lisp/init-modeline.elc \
	lisp/init-elisp.elc \
	lisp/init-crypto.elc \
	lisp/init-prog.elc \
	lisp/init-eudc.elc \
	lisp/init-flymake.elc
	emacs $(OPTIONS) $<

lisp/init-keys.elc: lisp/init-keys.el
	emacs $(OPTIONS) $<

lisp/init-auth.elc: lisp/init-auth.el
	emacs $(OPTIONS) $<

lisp/init-ibuffer.elc: lisp/init-ibuffer.el
	emacs $(OPTIONS) $<

lisp/init-email.elc: lisp/init-email.el
	emacs $(OPTIONS) $<

lisp/init-erc.elc: lisp/init-erc.el
	emacs $(OPTIONS) $<

lisp/init-completion.elc: lisp/init-completion.el
	emacs $(OPTIONS) $<

lisp/init-browser.elc: lisp/init-browser.el
	emacs $(OPTIONS) $<

lisp/init-date-time.elc: lisp/init-date-time.el
	emacs $(OPTIONS) $<

lisp/init-diary.elc: lisp/init-diary.el
	emacs $(OPTIONS) $<

lisp/init-recentf.elc: lisp/init-recentf.el
	emacs $(OPTIONS) $<

lisp/init-cedet.elc: lisp/init-cedet.el
	emacs $(OPTIONS) $<

lisp/init-speedbar.elc: lisp/init-speedbar.el
	emacs $(OPTIONS) $<

lisp/init-website.elc: lisp/init-website.el
	emacs $(OPTIONS) $<

lisp/init-dired.elc: lisp/init-dired.el
	emacs $(OPTIONS) $<

lisp/init-looks.elc: lisp/init-looks.el
	emacs $(OPTIONS) $<

lisp/init-modeline.elc: lisp/init-modeline.el
	emacs $(OPTIONS) $<

lisp/init-elisp.elc: lisp/init-elisp.el
	emacs $(OPTIONS) $<

lisp/init-crypto.elc: lisp/init-crypto.el
	emacs $(OPTIONS) $<

lisp/init-prog.elc: lisp/init-prog.el
	emacs $(OPTIONS) $<

lisp/init-eudc.elc: lisp/init-eudc.el
	emacs $(OPTIONS) $<

lisp/init-flymake.elc: lisp/init-flymake.el
	emacs $(OPTIONS) $<

clean:
	rm early-init.elc init.elc lisp/*.elc
