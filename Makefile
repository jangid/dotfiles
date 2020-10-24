#all: lisp/*.elc init.elc early-init.elc
all: 	early-init.elc lisp/init-use-package.elc \
	lisp/init-keys.elc \
	lisp/init-auth.elc \
	lisp/init-ibuffer.elc \
	lisp/init-email.elc \
	lisp/init-erc.elc \
	lisp/init-org.elc \
	lisp/init-icomplete.elc \
	lisp/init-browser.elc \
	lisp/init-crypto.elc \
	lisp/init-date-time.elc \
	lisp/init-diary.elc \
	lisp/init-recentf.elc \
	lisp/init-cedet.elc \
	lisp/init-speedbar.elc \
	lisp/init-website.elc \
	lisp/init-dired.elc \
	lisp/init-flymake.elc \
	lisp/init-looks.elc \
	lisp/init-modeline.elc \
	lisp/init-elisp.elc \
	lisp/init-flycheck.elc \
	lisp/init-org-extras.elc \
	lisp/init-esup.elc \
	init.elc

early-init.elc: early-init.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-use-package.elc: lisp/init-use-package.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-keys.elc: lisp/init-keys.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-auth.elc: lisp/init-auth.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-ibuffer.elc: lisp/init-ibuffer.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-email.elc: lisp/init-email.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-erc.elc: lisp/init-erc.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-org.elc: lisp/init-org.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-icomplete.elc: lisp/init-icomplete.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-browser.elc: lisp/init-browser.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-crypto.elc: lisp/init-crypto.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-date-time.elc: lisp/init-date-time.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-diary.elc: lisp/init-diary.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-recentf.elc: lisp/init-recentf.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-cedet.elc: lisp/init-cedet.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-speedbar.elc: lisp/init-speedbar.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-website.elc: lisp/init-website.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-dired.elc: lisp/init-dired.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-flymake.elc: lisp/init-flymake.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-looks.elc: lisp/init-looks.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-modeline.elc: lisp/init-modeline.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-elisp.elc: lisp/init-elisp.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-flycheck.elc: lisp/init-flycheck.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-org-extras.elc: lisp/init-org-extras.el
	emacs -batch -L lisp -f batch-byte-compile $^

lisp/init-esup.elc: lisp/init-esup.el
	emacs -batch -L lisp -f batch-byte-compile $^

init.elc: init.el
	emacs -batch -L lisp -f batch-byte-compile $^

#lisp/*.elc: lisp/*.el
#	emacs -batch -L lisp -f batch-byte-compile $^

clean:
	rm early-init.elc init.elc lisp/*.elc
