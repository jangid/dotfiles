all: 	early-init.elc lisp/init-use-package.elc \
	lisp/init-keys.elc \
	lisp/init-auth.elc \
	lisp/init-ibuffer.elc \
	lisp/init-email.elc \
	lisp/init-erc.elc \
	lisp/init-icomplete.elc \
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
	lisp/init-org.elc \
	lisp/init-eudc.elc \
	lisp/init-flymake.elc \
	lisp/init-flycheck.elc \
	lisp/init-org-extras.elc \
	lisp/init-esup.elc \
	lisp/init-eglot.elc \
	lisp/init-rust.elc \
	lisp/init-javascript.elc \
	lisp/init-python.elc \
	lisp/init-ruby.elc \
	lisp/init-kotlin.elc \
	lisp/init-java.elc \
	lisp/init-markdown.elc \
	lisp/init-docker.elc \
	lisp/init-twitter.elc \
	lisp/init-direnv.elc \
	init.elc

OPTIONS = -Q -batch -L lisp -f batch-byte-compile

early-init.elc: early-init.el
	emacs $(OPTIONS) $<

lisp/init-use-package.elc: lisp/init-use-package.el
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

lisp/init-icomplete.elc: lisp/init-icomplete.el
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

lisp/init-org.elc: lisp/init-org.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-eudc.elc: lisp/init-eudc.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-flymake.elc: lisp/init-flymake.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-flycheck.elc: lisp/init-flycheck.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-org-extras.elc: lisp/init-org-extras.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-esup.elc: lisp/init-esup.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-eglot.elc: lisp/init-eglot.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-rust.elc: lisp/init-rust.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-javascript.elc: lisp/init-javascript.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-python.elc: lisp/init-python.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-ruby.elc: lisp/init-ruby.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-kotlin.elc: lisp/init-kotlin.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-java.elc: lisp/init-java.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-markdown.elc: lisp/init-markdown.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-docker.elc: lisp/init-docker.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-twitter.elc: lisp/init-twitter.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

lisp/init-direnv.elc: lisp/init-direnv.el \
	lisp/init-use-package.elc
	emacs $(OPTIONS) $<

init.elc: init.el \
	lisp/init-keys.elc \
	lisp/init-auth.elc \
	lisp/init-ibuffer.elc \
	lisp/init-email.elc \
	lisp/init-erc.elc \
	lisp/init-icomplete.elc \
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
	lisp/init-org.elc \
	lisp/init-eudc.elc \
	lisp/init-flymake.elc \
	lisp/init-flycheck.elc \
	lisp/init-org-extras.elc \
	lisp/init-esup.elc \
	lisp/init-eglot.elc \
	lisp/init-rust.elc \
	lisp/init-javascript.elc \
	lisp/init-python.elc \
	lisp/init-ruby.elc \
	lisp/init-kotlin.elc \
	lisp/init-java.elc \
	lisp/init-markdown.elc \
	lisp/init-docker.elc \
	lisp/init-twitter.elc \
	lisp/init-direnv.elc
	emacs $(OPTIONS) $<

clean:
	rm early-init.elc init.elc lisp/*.elc
