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
(setq user-mail-address	"p4j@j4d.net"
      user-full-name "Pankaj Jangid")

;; The configuration is divided into many files called modules. Set
;; the load path for those modules.
(eval-and-compile
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)))

;; Update GNU ELPA signature
;;(require 'package)
;; (unless (package-installed-p 'gnu-elpa-keyring-update)
;;   (setq package-check-signature nil)
;;   (package-refresh-contents)
;;   (package-install 'gnu-elpa-keyring-update)
;;   (setq package-check-signature 'allow-unsigned)
;;   (package-refresh-contents))

;;(setq package-check-signature nil) ; this must be removed

;; activate use-package
(require 'init-use-package)

;; Environment variables
(require 'init-env)

;; Tools and utilities
;;(require 'init-bbdb) ; signature verification issue
(require 'init-ibuffer)
(require 'init-email)
(require 'init-erc)
(require 'init-org)
(require 'init-dired)
(require 'init-magit)
(require 'init-projectile)
(require 'init-which-key)
(require 'init-icomplete)
(require 'init-browser)
(require 'init-crypto)
(require 'init-date-time)
(require 'init-recentf)

;; Looks and themes
(require 'init-looks)			; Common UI settings - menu, tabs...
(require 'init-theme)
(require 'init-diminish)
(require 'init-modeline)

;; Editor settings
(require 'init-edit)

;; Programming languages
(require 'init-elisp)
(require 'init-rust)
(require 'init-javascript)
(require 'init-python)
(require 'init-dart)
(require 'init-go)
(require 'init-ruby)
;;(require 'init-java)
(require 'init-kotlin)

;; File types
(require 'init-docker)
(require 'init-yaml)

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
