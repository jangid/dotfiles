;;; init.el --- Emacs configuration -*- lexical-binding: t -*-

;;; Commentary:
;; The goal of this file is to provide light weight customizations to
;; your Emacs without changing much of the default behaviour.
;;
;; Another objective of this file is to keep this file updated with
;; the latest version of Emacs.  Currently, only major version 27 and
;; 28 are supported.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                  ;;
;;   The Emacs configuration file.                                  ;;
;;                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:
;; (profiler-start 'cpu)

;; Version check
(let ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "This config doesn't support version less than %s" minver)))

;; Packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(eval-and-compile
  (add-to-list 'load-path
           (expand-file-name "lisp" user-emacs-directory)))

(eval-when-compile (package-initialize))

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
(add-to-list 'exec-path "/Users/pankaj/.ghcup/bin")
(add-to-list 'exec-path
             "/Users/pankaj/.sdkman/candidates/ant/current/bin")
(add-to-list 'exec-path
             "/Users/pankaj/.sdkman/candidates/gradle/current/bin")
(add-to-list 'exec-path
             "/Users/pankaj/.sdkman/candidates/groovy/current/bin")
(add-to-list 'exec-path
             "/Users/pankaj/.sdkman/candidates/kotlin/current/bin")

(setenv "PATH" (mapconcat 'identity exec-path ":"))
(setenv "RUST_SRC_PATH"
    "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/")

(setenv "LANG" "en_US.UTF-8")

;; Utility Functions
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
     ((eq width 80) (set-frame-width nil 84))
     ((eq width 84) (set-frame-width nil 124))
     ((eq width 124) (set-frame-width nil 168))
     (t (set-frame-width nil 80))) ; default
    
    (message "Frame size: %sx%s" (frame-width) (frame-height))))

(defun my/cycle-frame-height ()
  "Cycle \"frame-height\"."
  (interactive)
  
  (let ((height (frame-height)))
    
    (cond
     ((eq height 44) (set-frame-height nil 48))
     (t (set-frame-height nil 44))) ; default
    
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

(defun my/erc-connect-libera ()
  "Connect to irc.libera.chat."
  (interactive)
  (erc-tls :server "irc.libera.chat"
	   :port 6697
	   :nick "jangid"
	   :full-name "Pankaj Jangid"))

(defun my/set-devanagari-input-method ()
  "Set `default-input-method' for Devanagari language."
  (if (equal current-language-environment "Devanagari")
      (progn
        (setq default-input-method "devanagari-inscript"))))

(defun my/turn-on-orgtbl ()
  "Turn on orgtbl minor mode."
  ;;(eval-and-compile (require 'org-table))
  (declare-function turn-on-orgtbl "org-table.el")
  (turn-on-orgtbl))

(custom-set-variables
 '(debug-on-error t)

 ;; packages
 '(package-selected-packages
   '(rust-mode
     ebdb
     use-package
     php-mode
     yaml-mode
     po-mode
     org-mime
     writegood-mode
     markdown-mode
     kotlin-mode
     gradle-mode
     clojure-mode
     solidity-mode
     haskell-mode
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
     company
     dockerfile-mode
     docker-compose-mode
     direnv
     diminish
     delight
     magit))

 ;; calendar, date, time
 ;; '(calendar-latitude +26.9)		; Jaipur
 ;; '(calendar-longitude +75.8)
 '(calendar-latitude [26 52 north])	; vector [deg min north/south]
 '(calendar-longitude [75 46 east])
 '(calendar-location-name "Jaipur, India")
 '(calendar-time-zone +330)   ; minutes difference from UTC
 
 ;; Bookmarks
 '(bookmark-fontify nil)
 
 ;; TAB cycle if there are only few candidates
 '(completion-cycle-threshold 3)

 ;; Enable indentation+completion using the TAB key.
 ;; Completion is often bound to M-TAB.
 '(tab-always-indent 'complete)
 '(tab-first-completion 'eol)

 ;; default email address and full name
 '(user-mail-address "pankaj@codeisgreat.org")
 '(user-full-name "Pankaj Jangid")
 
 ;; Keep the custom file separate from init.el. Also, do not load it
 ;; on startup. Instead, if you want to make a permanent setting then
 ;; look into custom.el and put that setting in this file in the next
 ;; section.
 '(custom-file (expand-file-name "custom.el" user-emacs-directory) t)
 ;; (when (file-exists-p custom-file)
 ;;   (load custom-file))
 
 ;; modeline
 '(column-number-mode t)
 
 ;; Programming
 '(show-paren-mode t)
 
 ;; tabs, indent etc
 '(indent-tabs-mode nil)
 ;; '(tab-width 4)
 
 ;; Frame
 ;; '(scroll-bar-mode nil)
 ;; '(vertical-scroll-bar nil t)
 ;; '(tool-bar-mode nil)
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
 ;; '(erc-autojoin-channels-alist
 ;;   '(("freenode.net")
 ;;     ("oftc.net" "#oftc" "#fsci")
 ;; ("libera.chat" "#django" "#erc" "#emacs" "emacs-beginners" "#org-mode"
 ;;  "#gnus" "#kicad" "#python" "#sr.ht" "#sr.ht.watercooler" "#sr.ht.ops")))
 
 ;; EasyPG
 '(epg-pinentry-mode 'loopback)
 
 ;; python
 '(python-shell-interpreter "python3")
 '(python-indent-guess-indent-offset-verbose nil)
 
 ;; Email
 '(mml-secure-openpgp-encrypt-to-self t)
 '(mml-secure-openpgp-signers '("7C956E6FF8587689"))
 '(mml-secure-openpgp-sign-with-sender t)

 ;; Gnus
 '(gnus-init-file "~/.gnus")
 '(gnus-startup-file "~/.newsrc")
 '(send-mail-function 'smtpmail-send-it)
 '(gnus-cloud-method "nnimap:gml")
 '(gnus-cloud-synched-files
   '("~/.authinfo.gpg"
     "~/.gnus.el"
     (:directory "~/News" :match ".*.SCORE\\'")))
 '(gnus-cloud-storage-method 'epg)
 '(gnus-cloud-interactive t)

 ;; Sessions
 '(sessions-directory
   (file-name-as-directory
    (concat user-emacs-directory "sessions")) t)
 '(desktop-restore-eager 5)
 '(desktop-path (list sessions-directory) t)
 '(desktop-base-file-name "emacs.desktop")
 '(savehist-file
   (concat sessions-directory "history") t)

 ;; Cursor
 '(visible-cursor nil)                  ; Works on text terminal only
 '(x-stretch-cursor t)                  ; On GUIs, cursor width equals
                                        ; that of characters
 
 ;; Bell
 '(visible-bell nil)

 ;; dictionary
 '(dictionary-server "dict.org"))

;; EBDB
(eval-when-compile
  ;; (add-to-list 'load-path
  ;;              (expand-file-name "ebdb_src" user-emacs-directory))
  (require 'ebdb)
  (require 'ebdb-mua))
(require 'ebdb-gnus)
(require 'ebdb-message)
(custom-set-variables
 '(ebdb-mua-pop-up nil)
 '(ebdb-mua-auto-update-p nil)
 '(ebdb-complete-mail t)
 '(ebdb-complete-mail-allow-cycling 5)
 '(ebdb-completion-display-record nil)
 '(ebdb-use-diary t)
 '(compose-mail-user-agent-warnings nil))

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

;; Company
(use-package company
  :delight (company-mode)
  :hook
  ((rust-mode . company-mode)
   (python-mode . company-mode)
   (java-mode . company-mode)
   (js-mode . company-mode)
   (ruby-mode . company-mode)
   (haskell-mode . company-mode)
   (cider-mode . company-mode)
   (cider-repl-mode . company-mode)))

;; Eglot
(use-package eglot
  :config
  ;; (defvar eglot-server-programs)
  ;; (add-to-list 'eglot-server-programs
  ;;              '((js-mode typescript-mode)
  ;;                "typescript-language-server" "--stdio"))
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
   (ruby-mode . eglot-ensure)
   ;; install ghcup and haskell tools or may be stack
   (haskell-mode . eglot-ensure)))

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
;; (use-package org-mime
;;   :init
;;   (custom-set-variables
;;    '(org-mime-library 'mml)))

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

;; Theme
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

(add-hook 'set-language-environment-hook
          'my/set-devanagari-input-method)

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
(add-hook 'message-mode-hook 'electric-quote-local-mode)
(add-hook 'message-mode-hook 'flyspell-mode)
;; (add-hook 'message-mode-hook 'my/turn-on-orgtbl)

;; ERC
;; Setup local key bindings i.e. while ERC is active
(add-hook 'erc-mode-hook
      (lambda ()
        (local-set-key (kbd "RET") nil)
        (local-set-key (kbd "C-c RET") 'erc-send-current-line)
        (local-set-key (kbd "C-c C-RET") 'erc-send-current-line)))
;; Key bindings to connect to IRC network
(global-set-key (kbd "C-c e f") 'my/erc-connect-freenode)
(global-set-key (kbd "C-c e g") 'my/erc-connect-gitter)
(global-set-key (kbd "C-c e o") 'my/erc-connect-oftc)
(global-set-key (kbd "C-c e l") 'my/erc-connect-libera)

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

;; Programming environment

(add-hook 'prog-mode-hook 'abbrev-mode)
(add-hook 'prog-mode-hook 'eldoc-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'electric-pair-local-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Elisp
;; (add-hook 'emacs-lisp-mode-hook 'flymake-mode)

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

;; key bindings for ibuffer
(global-set-key [?\C-x ?\C-b] #'ibuffer-other-window)

;; Key bindings for frame
(when (eq system-type 'darwin)
  (global-set-key (kbd "M-<f11>") 'toggle-frame-fullscreen))

(global-set-key (kbd "M-<f9>") 'my/cycle-frame-width)
(global-set-key (kbd "S-M-<f9>") 'my/cycle-frame-height)

;; Apple Keyboard - use command as meta for better ergonimics
(cond
 ((string= (system-name) "mb1.local")
  (custom-set-variables
   '(mac-command-modifier 'meta)
   '(mac-right-command-modifier 'none)
   '(mac-option-modifier 'super)
   '(mac-right-option-modifier 'none)))
 ((string= (system-name) "mb2.local")
  (custom-set-variables
   '(mac-command-modifier 'meta)
   '(mac-right-command-modifier 'meta)
   '(mac-option-modifier 'super)))
   ;; '(mac-right-option-modifier 'super)))
 (t
  (custom-set-variables
   '(mac-command-modifier 'meta)
   '(mac-right-command-modifier 'none)
   '(mac-option-modifier 'super)
   '(mac-right-option-modifier 'none))))

;; (profiler-start 'cpu)
;; (profiler-stop)
;; Sessions - This should always be done after custom-set-variables
;; i.e. after loading my-init-file.
(desktop-save-mode +1)
(savehist-mode +1)

;; start server for emacsclient support
(require 'server)
(run-with-timer
 5
 nil
 (lambda ()
   (unless (server-running-p) (server-start))))

(provide 'init)
;;; init.el ends here
