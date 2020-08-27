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

;; default email address and full name
(setq user-mail-address	"pankaj.jangid@gmail.com"
      user-full-name "Pankaj Jangid")

;; The configuration is divided into many files called modules. Set
;; the load path for those modules.
(eval-and-compile
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)))

;; activate use-package
(require 'init-use-package)

;; (require 'package)
;;(use-package gnu-elpa-keyring-update
;;   :ensure t)
;;   :config
;;   (setq package-check-signature t))

;; Environment variables
(require 'init-env)

;; Tools and utilities
(require 'init-magit)
(require 'init-ibuffer)
(require 'init-gnus)
(require 'init-erc)
(require 'init-org)
(require 'init-bbdb) ; signature verification issue
(require 'init-dired)
(require 'init-projectile)
(require 'init-which-key)
(require 'init-company)
(require 'init-icomplete)
(require 'init-browser)
(require 'init-crypto)
(require 'init-flymake)
(require 'init-date-time)
(require 'init-recentf)

;; Looks and themes
(require 'init-looks)			; Common UI settings - menu, tabs...
(require 'init-theme)
(require 'init-delight)
;; (require 'init-modeline)

;; Editor settings
(require 'init-edit)

;; Programming languages
(require 'init-prog)			; Common programming settings
(require 'init-elisp)
(require 'init-rust)
(require 'init-javascript)
(require 'init-python)
(require 'init-dart)
(require 'init-go)
(require 'init-ruby)

;; Session save and restore
;; (require 'init-desktop)

;; Keep the custom file separate from init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; start server for emacsclient support
(require 'server)
(unless (server-running-p) (server-start))

(provide 'init)
;;; init.el ends here
