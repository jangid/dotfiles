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
;; (setq debug-on-error t)

;; Version check
(let ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "This config doesn't support version less than %s" minver)))

;; default email address and full name
(setq user-mail-address	"pankaj@codeisgreat.org"
      user-full-name "Pankaj Jangid")

;; The configuration is divided into many files called modules. Set
;; the load path for those modules.
(eval-and-compile
  (add-to-list 'load-path
	       (expand-file-name "lisp" user-emacs-directory)))

(require 'init-env)
(require 'init-keys)
(require 'init-looks)
(require 'init-auth)
(require 'init-ibuffer)
(require 'init-email)
(require 'init-mime)
(require 'init-erc)
(require 'init-crypto)
(require 'init-prog)
(require 'init-org)
(require 'init-completion)
(require 'init-browser)
(require 'init-date-time)
(require 'init-diary)
(require 'init-recentf)
(require 'init-cedet)
(require 'init-speedbar)
(require 'init-website)
(require 'init-dired)
(require 'init-flymake)
(require 'init-modeline)
(require 'init-elisp)
(require 'init-flycheck)
(require 'init-org-extras)
(require 'init-esup)
(require 'init-eglot)
(require 'init-rust)
(require 'init-javascript)
(require 'init-python)
(require 'init-ruby)
(require 'init-kotlin)
(require 'init-java)
(require 'init-markdown)
(require 'init-docker)
(require 'init-twitter)
(require 'init-direnv)
(require 'init-eudc)
(require 'init-ebdb)
(require 'init-company)
(require 'init-plantuml)
(require 'init-php)

;; (require 'vtl)

;; Keep the custom file separate from init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; start server for emacsclient support
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (progn
	      (eval-and-compile (require 'server))
	      (unless (server-running-p) (server-start)))))

(provide 'init)
;;; init.el ends here
