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
;;   SECTION 1 - Configuration of external packages		    ;;
;;   SECTION 2 - Configuration of built-in packages		    ;;
;;   SECTION 3 - Utility functions		                    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 0 - Globals                                            ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; Environment
(add-to-list 'exec-path "/sbin")
(add-to-list 'exec-path "/usr/sbin")
(add-to-list 'exec-path "/bin")
(add-to-list 'exec-path "/usr/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/Users/pankaj/go/bin")
(add-to-list 'exec-path "/Library/TeX/texbin")
(add-to-list 'exec-path "/Library/Apple/usr/bin")
(add-to-list 'exec-path "~/.cargo/bin")

(setenv "PATH" (mapconcat 'identity exec-path ":"))
(setenv "RUST_SRC_PATH" "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/")

;; start server for emacsclient support
(require 'server)
(unless (server-running-p) (server-start))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 1 - Configuration of external packages		    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-when-compile
  (add-to-list 'load-path
	       (expand-file-name "use-package" user-emacs-directory))
  (require 'use-package))

;; (eval-and-compile
;;   (require 'use-package-ensure-system-package))

(eval-and-compile
  (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/")))
(eval-when-compile (package-initialize))

(use-package hideshow
  :diminish
  (hs-minor-mode . "hs"))

(use-package eldoc
  :diminish
  (eldoc-mode . "el"))

(use-package abbrev
  :diminish
  (abbrev-mode . "ab"))

;; Yasnippet
(use-package yasnippet
  :diminish
  (yas-minor-mode . "ys")
  :hook
  ((rust-mode . yas-minor-mode)
   (python-mode . yas-minor-mode)))

;; Company
(use-package company
  :diminish
  (company-mode . "co")
  :hook ((rust-mode . company-mode)
	 (python-mode . company-mode)))

;; Docker
(use-package dockerfile-mode)
(use-package docker-compose-mode)

(use-package which-key
  :init
  (defvar which-key-idle-delay 3.0)
  :config
  (declare-function which-key-mode "which-key")
  (which-key-mode)
  :diminish
  (which-key-mode . "wk"))

;; Eglot
(use-package eglot
  ;; :ensure-system-package
  ;; ((python3)
  ;;  (pip3 . python3-pip))
  :config
  (defvar eglot-server-programs)
  (add-to-list 'eglot-server-programs
	       '((js-mode typescript-mode)
		 ("typescript-language-server" "--stdio")))
  :hook
  (;; curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   (rust-mode . eglot-ensure)
   ;; pip3 install 'python-language-server[all]'
   (python-mode . eglot-ensure)
   ;; npm i -g typescrypt-language-server; npm i -g typescript
   (js-mode . eglot-ensure)
   ;; install ruby lang server
   (ruby-mode . eglot-ensure)))

;;	 (js-mode . eglot-ensure)))

;; flycheck
;; (use-package flycheck
;;   :hook
;;   ;; npm i -g eslint
;;   ((js-mode . flycheck-mode)))

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
  (defvar markdown-command "multimarkdown"))

;; org - TODO
;; (use-package org-mime
;;   :init
;;   (defvar org-mime-library)
;;   (setq org-mime-library 'mml))

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
(use-package ebdb
  :init
  (setq compose-mail-user-agent-warnings nil)
  :config
  (defvar ebdb-mua-pop-up)
  (defvar ebdb-completion-display-record)
  (setq ebdb-mua-pop-up nil)
  (setq ebdb-completion-display-record nil)
  (run-with-timer 5 nil (lambda ()
			  (use-package ebdb-message)
			  (use-package ebdb-gnus))))

;; velocity templates
(require 'vtl
	 (expand-file-name
	  "vtl.el"
	  (expand-file-name "lisp" user-emacs-directory)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 2 - Configuration of built-in packages		    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-and-compile
  (add-to-list 'load-path
	       (expand-file-name "lisp" user-emacs-directory)))

(require 'init-keys)
(require 'init-looks)
(require 'init-email)
(require 'init-erc)
(require 'init-diary)
(require 'init-session)
(require 'init-org)
(require 'init-website)
(require 'init-flymake)
(require 'init-elisp)
(require 'init-java)
(require 'init-js)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 3 - Utility functions		                    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-install-or-update ()
  "Install selected packages."
  (interactive)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))
  (package-refresh-contents)
  (package-install-selected-packages))

;; user specific init file, loaded after everything else - my-init.el
(defvar my-init-file)
(setq my-init-file
      (expand-file-name "my-init.el" user-emacs-directory))
(when (file-exists-p my-init-file)
  (load my-init-file))

(provide 'init)
;;; init.el ends here
