;;; init.el --- Emacs configuration -*- lexical-binding: t -*-
;;; Commentary:
;; This is the master configuration file.  This loads several other
;; files to give customized behaviour.  The goal of this file is to
;; provide light weight customizations to your Emacs without changing
;; much of the default behaviour.
;;
;; Another objective of this file is to keep this file updated with
;; the latest version of Emacs.

;;; Code:

;; Produce backtrace on error
(setq debug-on-error t)

;; Check emacs-version 26.3
(let ((minver "26.3"))
  (when (version< emacs-version minver)
    (error "Old Emacs.  Require v%s or higher" minver)))

;; Directory to hold modular lisp files
(eval-when-compile
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)))

;; Initialize packaging system
(require 'init-melpa)

;; Keep the custom file separate from init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; The configuration is divided into sections and each section has its
;; configuration file. These configuration files in turn load other
;; configuration files for components.
(require 'init-looks)
(require 'init-tools)

;; Load modular lisp packages. In each of these files the general
;; logic should be like this - IF the required PACKAGE exists THEN DO
;; the configuration ELSE mark the package for download. Later
;; (init-pack) can be called manually to download all marked packages.

(require 'init-diminish)
(require 'init-vars)
(require 'init-pack)
(require 'init-path)
(require 'init-keys)
;;(require 'init-theme)
(require 'init-magit)
(require 'init-lsp)
(require 'init-edit)
(require 'init-org)
(require 'init-ivy)
(require 'init-direnv)
(require 'init-prog)
;;(require 'init-gnus)
(require 'init-erc)
(require 'init-bbdb)

;; start server for emacsclient support
(require 'server)
(unless (server-running-p) (server-start))

(provide 'init)
;;; init.el ends here
