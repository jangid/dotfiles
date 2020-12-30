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
;;   SECTION 3 - Utility functions		                    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 0 - Globals                                            ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar start-time)
(defvar prev-time)
(setq prev-time (current-time))

(defun load-time ()
  "Load time of Emacs."
    (float-time (time-subtract (current-time) start-time)))

(defun diff-time (from-time)
  "Load time diff FROM-TIME."
  (float-time (time-subtract (current-time) from-time)))

(defun took-time (entity)
  "Log message for load time taken by ENTITY."
  (message "Took %s secs to load %s." (diff-time prev-time) entity)
  (setq prev-time (current-time)))

(defun total-time (entity)
  "Log message for total time till ENTITY is loaded."
  (message "Took %s secs to load %s." (diff-time start-time) entity))

(took-time early-init-file)

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
(require 'server)
(unless (server-running-p) (server-start))
(took-time "server")

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
(require 'init-eudc)
(require 'init-java)
(require 'init-js)
(require 'init-ruby)

(took-time "built-in packages")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 2 - Configuration of external packages		    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-when-compile
  (add-to-list 'load-path
	       (expand-file-name "use-package" user-emacs-directory))
  (require 'use-package))

(require 'use-package-ensure-system-package)

(eval-and-compile
  (prog1 "essential-packages"
    (let ((pkgs-all (list)); (list 'bind-key 'diminish))
	  (pkgs-to-install (list)))

      (setq package-archives
	    '(("melpa" . "https://melpa.org/packages/")
	      ("elpa"   . "https://elpa.gnu.org/packages/")
	      ("nongnu" . "http://elpa.nongnu.org/nongnu/")))
      
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

;; Company
(use-package company
  :hook ((rust-mode . company-mode)
	 (python-mode . company-mode)))

;; Direnv
;; (use-package direnv
;;   :ensure t
;;   :ensure-system-package direnv
;;   :config
;;   (declare-function direnv-mode "direnv")
;;   (direnv-mode +1))

;; Docker
(use-package dockerfile-mode)
(use-package docker-compose-mode)

;; Eglot
(use-package eglot
  :ensure-system-package
  ((python3)
   (pip3 . python3-pip))
  :hook
  (;; curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   (rust-mode . eglot-ensure)
   ;; pip3 install 'python-language-server[a;;]'
   (python-mode . eglot-ensure)))

;;	 (js-mode . eglot-ensure)))

;; Exec Path
(use-package exec-path-from-shell
  :if window-system
  :init
  (defvar exec-path-from-shell-arguments '("-i"))
  :config
  (exec-path-from-shell-initialize))

;; flycheck
;; (use-package flycheck
;;   :hook ((kotlin-mode . flycheck-mode)
;; 	 (plantuml-mode . flycheck-mode)))

;; kotlin, gradle
;; (use-package kotlin-mode
;;   :mode
;;   (("\\.kt\\'" . kotlin-mode)
;;    ("\\.kts\\'" . kotlin-mode))
;;   :config
;;   (add-hook 'kotlin-mode-hook #'display-line-numbers-mode)
;;   (add-hook 'kotlin-mode-hook #'hs-minor-mode)
;;   (add-hook 'kotlin-mode-hook #'abbrev-mode)
;;   (use-package gradle-mode)
;;   (use-package flycheck-kotlin))

;; markdown
(use-package markdown-mode
  :commands
  (markdown-mode gfm-mode)
  :mode
  (("README\\.md\\’" . gfm-mode)
   ("\\.md\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown"))

;; org - TODO
;; (use-package org-mime
;;   :init
;;   (defvar org-mime-library 'mml))

;; gnuplot
;; (use-package gnuplot)
;; (use-package gnuplot-mode)

;; php
;; (use-package php-mode
;;   :mode "\\.php\\'"
;;   :interpreter "/usr/local/bin/php"
;;   :config
;;   (add-hook 'php-mode-hook #'display-line-numbers-mode)
;;   (add-hook 'php-mode-hook #'electric-pair-local-mode)
;;   (add-hook 'php-mode-hook #'hs-minor-mode)
;;   (add-hook 'php-mode-hook #'abbrev-mode))

;; twitter
;; (use-package twittering-mode
;;   :init
;;   (defalias 'epa--decode-coding-string 'decode-coding-string)
;;   :config
;;   (defvar twittering-use-master-password t))

;; rust-lang
(use-package rust-mode)

;; plantuml
;; (use-package plantuml-mode)
;; (use-package flycheck-plantuml)

;; Ebdb
;; TODO - load time is too much for this package.
(use-package ebdb
  :init
  (setq compose-mail-user-agent-warnings nil)
  (defvar ebdb-mua-pop-up nil)
  ;; :config
  ;; (use-package ebdb-message)
  ;; (use-package ebdb-gnus))
  :hook
  (emacs-startup . (lambda ()
		     (use-package ebdb-message)
		     (use-package ebdb-gnus))))

;; velocity templates
(require 'vtl)

(took-time "external packages")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 3 - Utility functions		                    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-install-or-update ()
  "Install selected packages."
  (interactive)
  (setq package-archives
	'(("melpa" . "https://melpa.org/packages/")
	  ("elpa"   . "https://elpa.gnu.org/packages/")
	  ("nongnu" . "http://elpa.nongnu.org/nongnu/")))
  (package-refresh-contents)
  (package-install-selected-packages))

;; user specific init file, loaded after everything else - my-init.el
(defvar my-init-file)
(setq my-init-file (expand-file-name "my-init.el" user-emacs-directory))
(when (file-exists-p my-init-file)
  (load my-init-file))

(setq inhibit-startup-echo-area-message "pankaj")
(total-time user-init-file)

(provide 'init)
;;; init.el ends here
