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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   The Emacs configuration file.				    ;;
;; 								    ;;
;;   This config file is organized as follows:			    ;;
;; 								    ;;
;;   SECTION 0 - Globals                                            ;;
;;   SECTION 1 - Configuration of built-in packages		    ;;
;;   SECTION 2 - Configuration of external packages		    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 0 - Globals                                            ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar start-time (current-time))

;; (setq debug-on-error t)

;; Version check
(let ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "This config doesn't support version less than %s" minver)))

;; default email address and full name
(setq user-mail-address	"pankaj@codeisgreat.org"
      user-full-name "Pankaj Jangid")

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 1 - Configuration of built-in packages		    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-and-compile
  (add-to-list 'load-path
	       (expand-file-name "lisp" user-emacs-directory)))

(require 'init-keys)
(require 'init-looks)
(require 'init-auth)
(require 'init-ibuffer)
(require 'init-email)
(require 'init-mime)
(require 'init-erc)
(require 'init-crypto)
(require 'init-prog)
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
(require 'init-python)
(require 'init-org)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 2 - Configuration of external packages		    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-when-compile
  (add-to-list 'load-path
	       (expand-file-name "use-package" user-emacs-directory))
  (require 'use-package))

(eval-and-compile
  (prog1 "essential-packages"
    (let ((pkgs-all (list 'bind-key
			  'diminish))
	  (pkgs-to-install (list)))

      (setq package-archives
	    '(("melpa" . "https://melpa.org/packages/")
	      ("elpa"   . "https://elpa.gnu.org/packages/")
	      ("nongnu" . "http://elpa.gnu.org/nongnu/")))
      
      (eval-when-compile (package-initialize))
      
      ;; (message "PackagesAll %s" pkgs-all)

      (require 'package)
      (dolist (pkg pkgs-all)		; prepare list
	;; (message "checking %s" pkg)
	(unless (package-installed-p pkg)
	  ;; (message "%s not installed." pkg)
	  (push pkg pkgs-to-install)
	  ;; (message "Added to list.")
	  ))
      
      ;; (message "PackageToInstall %s" pkgs-to-install)
      
      (unless (null pkgs-to-install)	; packages to install?
	  (progn
	    (package-refresh-contents)
	    (dolist (pkg pkgs-to-install)
	      (package-install pkg)))))))

;; Configure packages
;; Company
(use-package company
  :ensure t
  :hook ((rust-mode . company-mode)
	 (python-mode . company-mode)))

;; Direnv
(use-package direnv
  :ensure t
  :config
  (declare-function direnv-mode "direnv")
  (direnv-mode +1))

;; Docker
(use-package dockerfile-mode
  :ensure t)
(use-package docker-compose-mode
  :ensure t)

;; Eglot
(use-package eglot
  :ensure t
  :hook ((rust-mode . eglot-ensure)
	 (python-mode . eglot-ensure)))

;; Exec Path
(use-package exec-path-from-shell
  :ensure t
  :if window-system
  :init
  (defvar exec-path-from-shell-arguments '("-i"))
  :hook
  (emacs-startup . exec-path-from-shell-initialize))

;; flycheck
(use-package flycheck
  :ensure t
  :hook ((kotlin-mode . flycheck-mode)
	 (plantuml-mode . flycheck-mode)))

;; kotlin, gradle
(use-package kotlin-mode
  :ensure t
  :mode
  (("\\.kt\\'" . kotlin-mode)
   ("\\.kts\\'" . kotlin-mode))
  :config
  (add-hook 'kotlin-mode-hook #'display-line-numbers-mode)
  (add-hook 'kotlin-mode-hook #'hs-minor-mode)
  (add-hook 'kotlin-mode-hook #'abbrev-mode)
  (use-package gradle-mode
    :ensure t)
  (use-package flycheck-kotlin
    :ensure t))

;; markdown
(use-package markdown-mode
  :ensure t
  :mode
  (("\\.md\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode)))

;; org - TODO
(use-package org-mime
  :ensure t
  :init
  (defvar org-mime-library 'mml))

;; gnuplot
(use-package gnuplot
  :ensure t)
(use-package gnuplot-mode
  :ensure t)

;; php
(use-package php-mode
  :ensure t
  :mode "\\.php\\'"
  :interpreter "/usr/local/bin/php"
  :config
  (add-hook 'php-mode-hook #'display-line-numbers-mode)
  (add-hook 'php-mode-hook #'electric-pair-local-mode)
  (add-hook 'php-mode-hook #'hs-minor-mode)
  (add-hook 'php-mode-hook #'abbrev-mode))

;; twitter
(use-package twittering-mode
  :ensure t
  :init
  (defalias 'epa--decode-coding-string 'decode-coding-string)
  :config
  (defvar twittering-use-master-password t))

;; rust-lang
(use-package rust-mode
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'display-line-numbers-mode)
  (add-hook 'rust-mode-hook #'electric-pair-local-mode)
  (add-hook 'rust-mode-hook #'hs-minor-mode)
  (add-hook 'rust-mode-hook #'abbrev-mode))

;; plantuml
(use-package plantuml-mode
  :ensure t)
(use-package flycheck-plantuml
  :ensure t)

;; Ebdb
;; TODO - load time is too much for this package.
(use-package ebdb
  :ensure t
  :init
  (setq compose-mail-user-agent-warnings nil)
  (defvar ebdb-mua-pop-up nil)
  :hook
  (emacs-startup . (lambda ()
		     (use-package ebdb-message)
		     (use-package ebdb-gnus))))

;; (require 'vtl)

(defun load-time ()
  (let ((end-time (current-time)))
    (float-time (time-subtract end-time start-time))))

(setq inhibit-startup-echo-area-message
      "pankaj")

(message "Took %s secs to load." (load-time))

(provide 'init)
;;; init.el ends here
