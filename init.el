;;; init.el --- Emacs configuration -*- lexical-binding: t -*-
;;; Commentary:
;; This is the master configuration file.  This loads several other
;; files to give customized behaviour.  The goal of this file is to
;; provide light weight customizations to your Emacs without changing
;; much of the default behaviour.
;;
;; Another objective of this file is to keep this file updated with
;; the latest version of Emacs.  Currently, only major version 27 is
;; supported.

;;; Code:

;; Produce backtrace on error
(setq debug-on-error t)

;; utility package required by all other packages
(require 'init-pkg
	 (expand-file-name "lisp/init-pkg.el" user-emacs-directory))

;; The configuration is divided into sections and each section has its
;; configuration file. These configuration files in turn load other
;; configuration files for components.

(require 'init-env)
(require 'init-magit)
(require 'init-ibuffer)
(require 'init-modeline)
(require 'init-gnus)
(require 'init-erc)
(require 'init-org)
(require 'init-bbdb)
(require 'init-dired)
(require 'init-projectile)
(require 'init-which-key)
(require 'init-company)
(require 'init-icomplete)
(require 'init-browser)
(require 'init-crypto)
(require 'init-flymake)
(require 'init-elisp)
(require 'init-rust)
(require 'init-javascript)
(require 'init-misc)
(require 'init-sanity-tomorrow-bright)
(require 'init-delight)
;; (require 'init-looks)
(require 'init-edit)
(require 'init-desktop)
;;(require 'init-prog)

;; Keep the custom file separate from init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; start server for emacsclient support
(require 'server)			; I don't know why this is
					; required after
					; package-initialize
(unless (server-running-p) (server-start))

(provide 'init)
;;; init.el ends here
