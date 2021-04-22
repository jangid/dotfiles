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
;;                                                                  ;;
;;   The Emacs configuration file.                                  ;;
;;                                                                  ;;
;;   This config file is organized as follows:                      ;;
;;                                                                  ;;
;;   SECTION - Globals                                              ;;
;;   SECTION - Configuration of external packages                   ;;
;;   SECTION - Configuration of built-in packages                   ;;
;;   SECTION - Load my-init.el                                      ;;
;;                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                  ;;
;;   SECTION 0 - Globals                                            ;;
;;                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-and-compile
  (add-to-list 'load-path
           (expand-file-name "lisp" user-emacs-directory)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                  ;;
;;   SECTION 0 - Utility Functions                                  ;;
;;                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl-lib)

(defun add-to-classpath (item)
  "Add ITEM to CLASSPATH."
  
  (let ((class-path (getenv "CLASSPATH")))
    
    (defvar class-path-list (if class-path
				(split-string class-path ":")))
    (cl-pushnew item class-path-list)
    (setenv "CLASSPATH"
	    (mapconcat 'identity class-path-list ":"))))

(defun my/set-email-xface ()
  "Add Face header to email message."
  (interactive)
    (progn
    (declare-function message-add-header "message.el")
    (message-add-header
     (concat "Face: "
	     (gnus-face-from-file "face.png")))))

(defun my/unset-email-xface ()
  "Remove Face field."
  (interactive)
  (progn
    (declare-function message-remove-header "message.el")
    (message-remove-header "Face")))

(defun my/cycle-frame-width ()
  "Cycle \"frame-width\"."
  (interactive)
  
  (let ((width (frame-width)))
    
    (cond
     ; ((eq width 80) (set-frame-width nil 120))
     ((eq width 80) (set-frame-width nil 160))
     ; ((eq width 120) (set-frame-width nil 160))
     (t (set-frame-width nil 80))) ; default
    
    (message "Frame size: %sx%s" (frame-width) (frame-height))))

(defun my/cycle-frame-height ()
  "Cycle \"frame-height\"."
  (interactive)
  
  (let ((height (frame-height)))
    
    (cond
     ; ((eq height 36) (set-frame-height nil 42))
     ((eq height 36) (set-frame-height nil 48))
     ; ((eq height 42) (set-frame-height nil 48))
     (t (set-frame-height nil 36))) ; default
    
    (message "Frame size: %sx%s" (frame-width) (frame-height))))

(defun my/cycle-frame-size ()
  "Cycle frame-size."
  (interactive)
  
  (let ((width (frame-width))
	    (height (frame-height)))
    
    (cond ((and (eq width 80) (eq height 38))
	       (set-frame-size nil 120 38))
	      ((and (eq width 120) (eq height 38))
           (set-frame-size nil 120 43))
	      ((and (eq width 120) (eq height 43))
           (set-frame-size nil 160 43))
          ((and (eq width 160) (eq height 43))
           (set-frame-size nil 160 48))
	      (t (set-frame-size nil 80 38))) ; default
    
    (message "Frame size: %sx%s" (frame-width) (frame-height))))

;; TODO read nickname, fullname from file
(defun my/erc-connect-freenode ()
  "Connect to chat.freenode.net."
  (interactive)
  (erc :server "chat.freenode.net"
       :port 6667
       :nick "jangid"
       :full-name "Pankaj Jangid"))

(defun my/erc-connect-oftc ()
  "Connect to irc.oftc.net."
  (interactive)
  (erc :server "irc.oftc.net"
       :port 6667
       :nick "jangid"
       :full-name "Pankaj Jangid"))

(defun my/erc-connect-gitter ()
  "Connect to irc.gitter.im."
  (interactive)
  (erc-tls :server "irc.gitter.im"
	   :port 6667
	   :nick "jangid"
	   :full-name "Pankaj Jangid"))

(defun my/set-devanagari-input-method ()
  "Set `default-input-method' for Devanagari language."
  (if (equal current-language-environment "Devanagari")
      (progn
        (setq default-input-method "devanagari-inscript"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                  ;;
;;   SECTION 0 - Customize Variables                                ;;
;;                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq debug-on-error t)

;; Version check
(let ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "This config doesn't support version less than %s" minver)))

;; default email address and full name
(setq user-mail-address "pankaj@codeisgreat.org"
      user-full-name "Pankaj Jangid")
;; (profiler-start 'cpu)

;; Keep the custom file separate from init.el. Also, do not load it on
;; startup. Instead, if you want to make a permanent setting then look
;; into custom.el and put that setting in this file in the next
;; section.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; (when (file-exists-p custom-file)
;;   (load custom-file))

;; User specific customizations. Put here for persistent settings.
(custom-set-variables
 ;; calendar, date, time
 
 ;; '(calendar-latitude +28.6)		; New Delhi
 ;; '(calendar-longitude +77.3)
 ;; '(calendar-location-name "New Delhi, India")
 
 ;; '(calendar-latitude +26.9)		; Jaipur
 ;; '(calendar-longitude +75.8)
 '(calendar-latitude [26 52 north])	; vector [deg min north/south]
 '(calendar-longitude [75 46 east])
 '(calendar-location-name "Jaipur, India")
 
 '(calendar-time-zone +330)   ; minutes difference from UTC
 ;; '(display-time-day-and-date t)
 ;; '(display-time-mode t)

 ;; modeline
 '(column-number-mode t)

 ;; Programming
 '(show-paren-mode t)

 ;; tabs, indent etc
 '(indent-tabs-mode nil)
 ;; '(tab-width 4)
 
 ;; Frame
 '(scroll-bar-mode nil)
 ;; '(vertical-scroll-bar nil t)
 '(tool-bar-mode nil)
 '(frame-resize-pixelwise nil)
 
 ;; version control
 '(add-log-dont-create-changelog-file t)

 ;; dired
 '(dired-use-ls-dired nil)
 '(ls-lisp-use-insert-directory-program nil)

 ;; bell
 '(ring-bell-function 'ignore)
 
 ;; browswer
 '(browse-url-browser-function 'eww-browse-url)
 ;; '(shr-color-visible-distance-min 100)
 ;; '(shr-color-visible-luminance-min 70)

 ;; Mime
 ;; '(mailcap-user-mime-data nil)
 
 ;; Auth Source
 '(auth-sources '("~/.authinfo.gpg"))

 ;; Mouse
 '(mouse-avoidance-mode nil)
 '(mouse-avoidance-banish-position
  '((frame-or-window . frame)
    (side . right)
    (side-pos . 0)
    (top-or-bottom . bottom)
    (top-or-bottom-pos . 3)))

 ;; Erc
 '(erc-prompt-for-password nil)
 '(erc-prompt-for-nickserv-password nil)
 '(erc-use-auth-source-for-nickserv-password t)
 '(erc-autojoin-channels-alist
   '(("freenode.net" "#erc" "#emacs" "#gnus" "#python" "#django"
      "#postgresql" "##rust" "#rust-embedded" "##aws" "#nmigen")
     ("oftc.net" "#oftc" "#fsci")))

 ;; EasyPG
 '(epg-pinentry-mode 'loopback)

 ;; python
 '(python-shell-interpreter "python3")
 '(python-indent-guess-indent-offset-verbose nil)
 
 ;; Email
 '(mml-secure-openpgp-encrypt-to-self t)
 '(mml-secure-openpgp-signers '("7C956E6FF8587689"))
 '(mml-secure-openpgp-sign-with-sender t)

 '(gnus-init-file "~/.gnus")
 '(gnus-startup-file "~/.newsrc")

 '(send-mail-function 'smtpmail-send-it)

 ;; Sessions
 '(sessions-directory
   (file-name-as-directory
    (concat user-emacs-directory "sessions")) t)
 '(desktop-restore-eager 5)
 '(desktop-path (list sessions-directory) t)
 '(desktop-base-file-name "emacs.desktop")
 '(savehist-file
   (concat sessions-directory "history") t)
 
 ;; packages
 '(package-selected-packages
   '(rust-mode
     php-mode
     yaml-mode
     po-mode
     org-mime
     writegood-mode
     markdown-mode
     kotlin-mode
     gradle-mode
     clojure-mode
     cider
     lua-mode
     gnuplot
     auctex
     plantuml-mode
     flycheck
     flycheck-plantuml
     flycheck-kotlin
     exec-path-from-shell
     eglot
     ebdb
     vertico
     corfu
     yasnippet
     yasnippet-snippets
     dockerfile-mode
     docker-compose-mode
     direnv
     diminish
     delight
     ;; company
     )))

(custom-set-faces
 )

;; Environment
(add-to-list 'exec-path "/sbin")
(add-to-list 'exec-path "/usr/sbin")
(add-to-list 'exec-path "/bin")
(add-to-list 'exec-path "/usr/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/Users/pankaj/go/bin")
(add-to-list 'exec-path "/Library/TeX/texbin")
(add-to-list 'exec-path "/Library/Apple/usr/bin")
(add-to-list 'exec-path "/Users/pankaj/.cargo/bin")
(add-to-list 'exec-path
             "/Users/pankaj/.sdkman/candidates/ant/current/bin")
(add-to-list 'exec-path
             "/Users/pankaj/.sdkman/candidates/gradle/current/bin")
(add-to-list 'exec-path
             "/Users/pankaj/.sdkman/candidates/groovy/current/bin")
(add-to-list 'exec-path
             "/Users/pankaj/.sdkman/candidates/kotlin/current/bin")
;; (add-to-list 'exec-path
;;              "/usr/local/opt/gcc/bin")

(setenv "PATH" (mapconcat 'identity exec-path ":"))
(setenv "RUST_SRC_PATH"
    "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/")

(setenv "LANG" "en_US")

;; start server for emacsclient support
(require 'server)
(run-with-timer
 5
 nil
 (lambda ()
   (unless (server-running-p) (server-start))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                  ;;
;;   Configuration of external packages                             ;;
;;                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-when-compile
  (add-to-list 'load-path
           (expand-file-name "use-package" user-emacs-directory))
  (require 'use-package))

(eval-when-compile (package-initialize))

(use-package tex
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil))

;; (use-package exec-path-from-shell
;;   :config
;;   (when (memq window-system '(mac ns x))
;;     (declare-function exec-path-from-shell-initialize
;;                       "exec-path-from-shell-initialize.el")
;;     (exec-path-from-shell-initialize)))

(use-package hideshow
  :delight (hs-minor-mode))

(use-package eldoc
  :delight (eldoc-mode))

(use-package abbrev
  :delight (abbrev-mode))

;; Enable vertico
;; (use-package vertico
;;   :config
;;   (declare-function vertico-mode "vertico.el")
;;   (vertico-mode))

;; Configure corfu
;; (use-package corfu
;;   ;; Optionally use TAB for cycling, default is `corfu-complete'.
;;   ;; :bind (:map corfu-map
;;   ;;        ("TAB" . corfu-next)
;;   ;;        ("S-TAB" . corfu-previous))

;;   ;; Enable the overlay only for certain modes.
;;   ;; For example it is not a useful UI for completions at point in the
;;   ;; minibuffer.
;;   :hook ((prog-mode . corfu-mode)
;;          (eshell-mode . corfu-mode)))

;;   :config

;;   ;; Optionally enable cycling for `corfu-next' and `corfu-previous'.
;;   ;; (setq corfu-cycle t)
;; )

;; Use the `orderless' completion style.
;; Enable `partial-completion' for files to allow path expansion.
;; You may prefer to use `initials' instead of `partial-completion'.
;; (use-package orderless
;;   :init
;;   (setq completion-styles '(orderless)
;;         completion-category-defaults nil
;;         completion-category-overrides '((file (styles . (partial-completion))))))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; Completion is often bound to M-TAB.
  (setq tab-always-indent 'complete))

;; Yasnippet
(use-package yasnippet
  :delight (yas-minor-mode)
  :hook
  ((lua-mode . yas-minor-mode)
   (rust-mode . yas-minor-mode)
   (python-mode . yas-minor-mode)
   (java-mode . yas-minor-mode)
   (js-mode . yas-minor-mode)
   (ruby-mode . yas-minor-mode))
  :config
  (use-package yasnippet-snippets
    :config
    (declare-function yas-reload-all "yasnippet.el")
    (yas-reload-all)))

;; Company
;; (use-package company
;;   :delight (company-mode)
;;   :hook
;;   ((rust-mode . company-mode)
;;    (python-mode . company-mode)
;;    (java-mode . company-mode)
;;    (js-mode . company-mode)
;;    (ruby-mode . company-mode)
;;    (cider-mode . company-mode)
;;    (cider-repl-mode . company-mode)))

;; Eglot
(use-package eglot
  :config
  (defvar eglot-server-programs)
  (add-to-list 'eglot-server-programs
               '((js-mode typescript-mode)
                 "typescript-language-server" "--stdio"))
  :hook
  (;; curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   (rust-mode . eglot-ensure)
   ;; pip3 install 'python-language-server[all]'
   (python-mode . eglot-ensure)
   ;; install eclipse.jdt.ls
   (java-mode . eglot-ensure)
   ;; npm i -g typescrypt-language-server; npm i -g typescript
   (js-mode . eglot-ensure)
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

;; org-mime
;; TODO: fix performance issue
(use-package org-mime
  :init
  (custom-set-variables
   '(org-mime-library 'mml)))

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

;; Clojure
(use-package clojure-mode)
(use-package cider
  :config
  (custom-set-variables
   '(cider-preferred-build-tool lein))
  :hook
  ((clojure-mode . cider-mode)))

;; PO-editor
(use-package po-mode)

;; Direnv
(use-package direnv
  :config
  (declare-function direnv-mode "direnv.el")
  (direnv-mode +1))

;; plantuml
;; Prerequisites - Java, Graphviz, PlantUML
(use-package plantuml-mode
  :init
  (setq plantuml-default-exec-mode 'executable)
  :mode
  (("\\.puml\\'" . plantuml-mode)
   ("\\.plantuml\\'" . plantuml-mode)))

;; EBDB
(setq compose-mail-user-agent-warnings nil) ; 'ebdb should handle it
(run-with-timer
 5
 nil
 (lambda()
   (eval-when-compile (require 'ebdb))
   (eval-when-compile (require 'ebdb-mua))
   (setq ebdb-completion-display-record nil)
   (setq ebdb-mua-pop-up nil)
   (require 'ebdb-gnus)
   (require 'ebdb-message)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                  ;;
;;   Configuration of built-in packages                             ;;
;;                                                                  ;;
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

(when (window-system)
  (custom-set-variables
   '(modus-themes-slanted-constructs t)
   '(modus-themes-bold-constructs nil))
  (load-theme 'modus-operandi))

(cond
 ((eq system-type 'gnu/linux)
  ;; On Debian, do this
  ;; sudo apt-get install fonts-noto
  (set-fontset-font t 'devanagari "Noto"))
 ((eq system-type 'darwin)
  ;; (set-fontset-font t 'devanagari "ITF Devanagari")
  (set-fontset-font t 'devanagari "Kohinoor Devanagari")))

(add-hook 'set-language-environment-hook 'my/set-devanagari-input-method)

;; Cursor
(setq visible-cursor nil)       ; Works on text terminal only
(setq x-stretch-cursor t)       ; On GUIs, cursor width equals
                    ; that of characters

;; global key bindings
(global-set-key [?\C-x ?\C-b] #'ibuffer-other-window)

;; tabs, indent etc.
;; (defvaralias 'c-basic-offset 'tab-width)

;; Emacs Development Environment
;; (eval-and-compile (require 'ede))
;; (global-ede-mode +1)
;; (ede-enable-generic-projects)

;; Semantic
;; TODO - Performance issue
;; (semantic-mode +1)

;; SRecode
;; TODO - Performance issue
;; (eval-and-compile (require 'srecode))
;; (global-srecode-minor-mode +1)
;; (srecode-minor-mode +1)

;; Flymake
(add-hook 'flymake-mode-hook
      (lambda ()
        (local-set-key (kbd "M-n") 'flymake-goto-next-error)
        (local-set-key (kbd "M-p") 'flymake-goto-prev-error)))


(add-hook 'prog-mode-hook 'abbrev-mode)
(add-hook 'prog-mode-hook 'eldoc-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'electric-pair-local-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Elisp
(add-hook 'emacs-lisp-mode-hook 'flymake-mode)

;; Java
(when (eq system-type 'darwin)
  (setenv "JAVA_HOME"
      (substring
       (shell-command-to-string "/usr/libexec/java_home -v 11")
       0 -1))
  (add-to-list 'exec-path
           (concat (getenv "JAVA_HOME") "/bin"))
  (setenv "PATH" (mapconcat 'identity exec-path ":")))

(add-to-classpath
 (substring
  (shell-command-to-string
   (format
    "find %s -name 'org.eclipse.equinox.launcher_*jar'"
    (expand-file-name
     "eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins"
     user-emacs-directory)))
  0 -1))

(when (eq system-type 'darwin)
  (setenv "ATLAS_HOME" "/usr/local/opt/atlassian-plugin-sdk/libexec"))

;; JavaScript
(add-to-list
 'auto-mode-alist
 `(,(regexp-opt '(".mjs" ".cjs")) . js-mode))

(defvar js-indent-level)
(setq js-indent-level 2)

;; Diary
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
(add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)

;; Emails
(defun my/turn-on-orgtbl ()
  "Turn on orgtbl minor mode."
  ;;(eval-and-compile (require 'org-table))
  (declare-function turn-on-orgtbl "org-table.el")
  (turn-on-orgtbl))

(add-hook 'message-mode-hook 'electric-quote-local-mode)
(add-hook 'message-mode-hook 'flyspell-mode)
(add-hook 'message-mode-hook 'my/turn-on-orgtbl)

;; ERC
;; Setup local key bindings i.e. while ERC is active
(add-hook 'erc-mode-hook
      (lambda ()
        (local-set-key (kbd "RET") nil)
        (local-set-key (kbd "C-c RET") 'erc-send-current-line)
        (local-set-key (kbd "C-c C-RET") 'erc-send-current-line)))

;; Org
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(custom-set-variables
 '(org-directory "~/work/personal/docs/org")
 '(org-agenda-files
   (concat org-directory "/agenda-files"))
 '(org-agenda-include-diary t)
 '(org-default-notes-file
   (concat org-directory "/notes.org"))
 '(org-capture-templates nil)
 '(org-refile-targets
   '((org-agenda-files :maxlevel . 3)))
 '(org-todo-keywords
   '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)"
               "|"
               "DONE(d)" "CANCELLED(c)")))
 '(org-babel-load-languages
   '((emacs-lisp . t)
     (R . t)
     (python . t)
     (C . t)
     (java . t)
     (js . t)
     (css . t)
     (sql . t)
     (plantuml . t))))

;; Key bindings to connect to IRC network
(global-set-key (kbd "C-c e f") 'my/erc-connect-freenode)
(global-set-key (kbd "C-c e g") 'my/erc-connect-gitter)
(global-set-key (kbd "C-c e o") 'my/erc-connect-oftc)

;; Key bindings for frame
(when (eq system-type 'darwin)
  (global-set-key (kbd "M-<f11>") 'toggle-frame-fullscreen))

(global-set-key (kbd "M-<f9>") 'my/cycle-frame-width)
(global-set-key (kbd "S-M-<f9>") 'my/cycle-frame-height)

;; Keyboard
(cond
 ((string= (system-name) "mb1.local")
  (custom-set-variables
   '(mac-command-modifier 'meta)
   '(mac-right-command-modifier 'none)
   '(mac-option-modifier 'super)
   '(mac-right-option-modifier 'none)))
 ((string= (system-name) "mb2.local")
  (custom-set-variables
   '(mac-command-modifier 'none)
   '(mac-right-command-modifier 'meta)
   '(mac-option-modifier 'none)
   '(mac-right-option-modifier 'super)))
 (t
  (custom-set-variables
   '(mac-command-modifier 'meta)
   '(mac-right-command-modifier 'none)
   '(mac-option-modifier 'super)
   '(mac-right-option-modifier 'none))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                  ;;
;;   Restore desktop session                                        ;;
;;                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (profiler-start 'cpu)
;; (profiler-stop)
;; Sessions - This should always be done after custom-set-variables
;; i.e. after loading my-init-file.
(desktop-save-mode +1)
(savehist-mode +1)

(provide 'init)
;;; init.el ends here
