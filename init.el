;;; init.el --- Emacs configuration -*- lexical-binding: t -*-

;;; Description

;; This is the master configuration file this loads several other
;; files to give customized behaviour. The goal of this file is to
;; provide light weight customizations to your emacs without changing
;; much of the default behaviour.
;;
;; Another objective of this file is to keep this file updated with
;; the latest version of emacs.

;;; Configuration

;; Check emacs-version 26.3

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((minver "26.3"))
  (when (version< emacs-version minver)
    (error "Old emacs. Require v%s or higher" minver)))

;; Directory to hold modular lisp files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Keep the custom file separate from init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Load modular lisp files
(require 'init-melpa)
(require 'init-path)
(require 'init-keys)
(require 'init-theme)

(provide 'init)
;;; init.el ends here
