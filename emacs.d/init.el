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
;;   SECTION 3 - Load my-init.el		                    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 0 - Globals                                            ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-and-compile
  (add-to-list 'load-path
	       (expand-file-name "lisp" user-emacs-directory)))

(require 'my-util)

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
(setenv "RUST_SRC_PATH"
	"~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/")

;; start server for emacsclient support
(require 'server)
(run-with-timer
 5
 nil
 (lambda ()
   (unless (server-running-p) (server-start))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 1 - Configuration of external packages		    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-when-compile
  (add-to-list 'load-path
	       (expand-file-name "use-package" user-emacs-directory))
  (require 'use-package))

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
   (python-mode . yas-minor-mode)
   (java-mode . yas-minor-mode)))

;; Company
(use-package company
  :diminish
  (company-mode . "co")
  :hook ((rust-mode . company-mode)
	 (python-mode . company-mode)
	 (java-mode . company-mode)))

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
   ;; install eclipse.jdt.ls
   (java-mode . eglot-ensure)
   ;; install ruby lang server
   (ruby-mode . eglot-ensure)))

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

;; YAML
(use-package yaml-mode
  :mode
  (("\\.yml\\’" . yaml-mode)
   ("\\.yaml\\’" . yaml-mode)))

;; Docker
(use-package dockerfile-mode
  :mode
  (("Dockerfile\\’" . dockerfile-mode)))

(use-package docker-compose-mode
  :mode
  (("docker-compose\\.yml\\’" . docker-compose-mode)
   ("docker-compose\\.yaml\\’" . docker-compose-mode)))

(use-package which-key
  :init
  (defvar which-key-idle-delay 3.0)
  :config
  (declare-function which-key-mode "which-key")
  (which-key-mode)
  :diminish
  (which-key-mode . "wk"))

;; org-mime - performance issue
;; (use-package org-mime
;;   :init
;;   (defvar org-mime-library)
;;   (setq org-mime-library 'mml))

;; gnuplot
(use-package gnuplot
  :mode
  (("\\.gp\\’" . gnuplot-mode)))

;; php
(use-package php-mode
  :mode
  (("\\.php\\’" . php-mode)))

;; rust-lang
(use-package rust-mode)

;; plantuml
(use-package plantuml-mode
  :init
  (setq plantuml-default-exec-mode 'executable)
  :mode
  (("\\.puml\\'" . plantuml-mode)))

(defvar ebdb-mua-pop-up)
(defvar ebdb-completion-display-record)
(setq ebdb-mua-pop-up nil)
(setq ebdb-completion-display-record nil)
(setq compose-mail-user-agent-warnings nil)
   
(run-with-timer
 5
 nil
 (lambda()
   (require 'ebdb-gnus)
   (require 'ebdb-message)))

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

;; Keys
(defvar mac-command-modifier)
(defvar mac-right-command-modifier)
(defvar mac-option-modifier)
(defvar mac-right-option-modifier)

(cond
 ((eq system-type 'darwin)
  ;; apple keyboard - use command as meta for better ergonimics
  (setq mac-command-modifier 'meta)
  (setq mac-right-command-modifier 'none)
  (setq mac-option-modifier 'super)
  (setq mac-right-option-modifier 'none)

  (setq visible-bell nil))
 (t
  (setq visible-bell nil)))

;; Looks

;; (when (window-system)
;;   (load-theme 'modus-operandi))

(cond
 ((eq system-type 'gnu/linux)
  ;; On Debian, do this
  ;; sudo apt-get install fonts-noto
  (set-fontset-font t 'devanagari "Noto"))
 ((eq system-type 'darwin)
  ;; (set-fontset-font "fontset-startup" 'devanagari "ITF Devanagari")
  ;; (set-fontset-font "fontset-startup" 'devanagari "Kohinoor Devanagari")
  (set-fontset-font t 'devanagari "Kohinoor Devanagari")))

;; Cursor
(setq visible-cursor nil)		; this works on text terminal only
(setq x-stretch-cursor t)		; on GUIs, cursor width equals that
					; of characters

;; global key bindings
(global-set-key [?\C-x ?\C-b] #'ibuffer-other-window)

;; Development
;; (eval-and-compile (require 'ede))
;; (global-ede-mode +1)
;; (ede-enable-generic-projects)
;; Semantic - Performance issue
;; (semantic-mode +1)
;; SRecode - Performance issue
;; (eval-and-compile (require 'srecode))
;; (global-srecode-minor-mode +1)

(add-hook 'prog-mode-hook 'abbrev-mode)
(add-hook 'prog-mode-hook 'eldoc-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'electric-pair-local-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'flymake-mode)

;; Java
(when (eq system-type 'darwin)
  (setenv "JAVA_HOME"
	  (substring
	   (shell-command-to-string "/usr/libexec/java_home")
	   0 -1))
  (add-to-list 'exec-path
   	       (concat (getenv "JAVA_HOME") "/bin"))
  (setenv "PATH" (mapconcat 'identity exec-path ":")))

(add-to-classpath
 (substring
  (shell-command-to-string
   (format "find %s -name 'org.eclipse.equinox.launcher_*jar'"
	   (expand-file-name "eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins"
			     user-emacs-directory)))
  0 -1))

;; JavaScript
(add-to-list
 'auto-mode-alist
 `(,(regexp-opt '(".mjs" ".cjs")) . js-mode))

(setq indent-tabs-mode nil)
(defvar js-indent-level)
(setq js-indent-level 2)

;; Flymake
(add-hook 'flymake-mode-hook
	  (lambda ()
	    (local-set-key (kbd "M-n") 'flymake-goto-next-error)
	    (local-set-key (kbd "M-p") 'flymake-goto-prev-error)))

;; Diary
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
(add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)

;; Emails
(add-hook 'message-mode-hook 'electric-quote-mode)
(add-hook 'message-mode-hook 'flyspell-mode)

;; ERC
;; Setup local key bindings i.e. while ERC is active
(add-hook 'erc-mode-hook
	  (lambda ()
	    (local-set-key (kbd "RET") nil)
	    (local-set-key (kbd "C-c RET") 'erc-send-current-line)
	    (local-set-key (kbd "C-c C-RET") 'erc-send-current-line)))

;; Sessions
(defvar sessions-directory
  (file-name-as-directory
   (concat user-emacs-directory "sessions"))
  "Directory to store Emacs desktop sessions and minibuffer history.")

(require 'desktop)
(setq desktop-restore-eager 5)
(setq desktop-path `(,sessions-directory))
(setq desktop-base-file-name "emacs.desktop") ; not a hidden file
(desktop-save-mode +1)

(eval-when-compile (require 'savehist))
(setq savehist-file
      (concat sessions-directory "history"))
(savehist-mode +1)

;; Org
(add-hook 'message-mode-hook 'turn-on-orgtbl)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(custom-set-variables
 '(org-directory "~/Documents/org")
 '(org-agenda-include-diary t)
 '(org-capture-templates
  '(("t" "Todo" entry (file+headline "notes.org" "Tasks")
     "* TODO %?\n %i")
    ("T" "Tickler" entry (file+headline "gtd.org" "Ticklers")
     "* TODO %?\n %U\n %i")))
 '(org-refile-targets
  `((,(concat org-directory "/gtd.org") :maxlevel . 3)
    (,(concat org-directory "/optimizory.org") :maxlevel . 3)
    (,(concat org-directory "/personal.org") :maxlevel . 3)
    (,(concat org-directory "/j4d.org") :maxlevel . 3)
    (,(concat org-directory "/social.org") :maxlevel . 3)
    (,(concat org-directory "/someday.org") :level . 1)))
 '(org-todo-keywords
  '((sequence "TODO(t)"
	      "NEXT(n)"
	      "WAITING(w)"
	      "|"
	      "DONE(d)"
	      "CANCELLED(c)")))
 '(org-agenda-files
   (mapcar
    (lambda (x)
      (concat org-directory "/" x))
    '("notes.org"
      "gtd.org"
      "optimizory.org"
      "personal.org"
      "j4d.org"
      "social.org")))
 '(org-babel-load-languages
   '((emacs-lisp . t)
     (R . t)
     (python . t)
     (C . t)
     (java . t)
     (js . t)
     (css . t)
     (sql . t)
     (plantuml . t)))
 '(org-agenda-custom-commands
   '(("o" "At Optimzory" tags-todo "@optimizory"
	       ((org-agenda-overriding-header "Optimizory:")
		(org-agenda-skip-function
		 #'my-org-agenda-skip-all-siblings-but-first)))
     ("j" "At J4D" tags-todo "@j4d"
	       ((org-agenda-overriding-header "J4D:")
		(org-agenda-skip-function
		 #'my-org-agenda-skip-all-siblings-but-first)))
     ("h" "At Home" tags-todo "@home"
	       ((org-agenda-overriding-header "Home and Personal:")
		(org-agenda-skip-function
		 #'my-org-agenda-skip-all-siblings-but-first)))
     ("f" "At FSF" tags-todo "@fsf"
	       ((org-agenda-overriding-header "FSF:")
		(org-agenda-skip-function
		 #'my-org-agenda-skip-all-siblings-but-first)))
     ("n" "Agenda and all TODOs"
      ((agenda "")
       (alltodo ""))))))

;; My Website
(defvar site-project-dir
  (file-name-as-directory  "~/work/personal/codeisgreat")
  "My webstie.")

(defvar org-publish-project-alist
  `(("website"
     :components ("pages" "notes" "images" "other"))
    ("pages"
     :base-directory ,(concat site-project-dir "src/")
     :publishing-directory ,(concat site-project-dir "docs/")
     :publishing-function org-html-publish-to-html)
    ("notes"
     :base-directory ,(concat site-project-dir "src/notes")
     :publishing-directory ,(concat site-project-dir "docs/notes")
     :publishing-function org-html-publish-to-html)
    ("images"
     :base-directory ,(concat site-project-dir "src/images")
     :publishing-directory ,(concat site-project-dir "docs/images")
     :publishing-function org-publish-attachment)
    ("other"
     :base-directory ,(concat site-project-dir "src/other")
     :publishing-directory ,(concat site-project-dir "docs/other")
     :publishing-function org-publish-attachment))
  "My website project.")

;; Key bindings to connect to IRC network
(global-set-key (kbd "C-c e f") 'my/erc-connect-freenode)
(global-set-key (kbd "C-c e g") 'my/erc-connect-gitter)
(global-set-key (kbd "C-c e o") 'my/erc-connect-oftc)

;; Key bindings for frame
(when (eq system-type 'darwin)
  (global-set-key (kbd "M-<f11>") 'toggle-frame-fullscreen))

(global-set-key (kbd "M-<f9>") 'my/cycle-frame-size)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 								    ;;
;;   SECTION 3 - Load my-init.el				    ;;
;; 								    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; user specific init file, loaded after everything else - my-init.el
(defvar my-init-file)
(setq my-init-file
      (expand-file-name "my-init.el" user-emacs-directory))
(when (file-exists-p my-init-file)
  (load my-init-file))

(provide 'init)
;;; init.el ends here
