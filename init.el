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

;; Check emacs-major-version 27
(when (< emacs-major-version 27)
    (error "Old Emacs.  Require v%s or higher" 27))

;; The configuration is divided into sections and each section has its
;; configuration file. These configuration files in turn load other
;; configuration files for components.

(require 'init-tools)
(require 'init-melpa)
(require 'init-env)
(require 'init-looks)
(require 'init-edit)
(require 'init-prog)
(require 'init-vars)

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
