;;; init.el --- Emacs configuration -*- lexical-binding: t -*-

;;; Description

;; This is the master configuration file. This loads several other
;; files to give customized behaviour. The goal of this file is to
;; provide light weight customizations to your emacs without changing
;; much of the default behaviour.
;;
;; Another objective of this file is to keep this file updated with
;; the latest version of emacs.

;;; Configuration

;; Check emacs-version 26.3
(let ((minver "26.3"))
  (when (version< emacs-version minver)
    (error "Old emacs. Require v%s or higher" minver)))

;; Directory to hold modular lisp files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Keep the custom file separate from init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Load modular lisp packages. In each of these files the general
;; logic should be like this - IF the required PACKAGE exists THEN DO
;; the configuration ELSE mark the package for download. Later
;; (init-pack) can be called manually to download all marked packages.

(require 'init-vars)
(require 'init-melpa)
(require 'init-pack)
(require 'init-path)
(require 'init-keys)
(require 'init-theme)
(require 'init-flycheck)
(require 'init-edit)
(require 'init-org)
(require 'init-ivy)
(require 'init-direnv)
(require 'init-company)
(require 'init-python)
(require 'init-gnus)

;; start server for emacsclient support
(server-start)

(provide 'init)
;;; init.el ends here
