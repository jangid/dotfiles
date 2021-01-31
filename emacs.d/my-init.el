;;; my-init.el --- user customizations
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; calendar, date, time
 
 ;; 1 minute is equal to 60 seconds.  1 degree i.e. 1 hour is equal to
 ;; 60 minutes or 3600 seconds.  To calculate decimal degrees, we use
 ;; the DMS to decimal degree formula below:
 ;;
 ;; Decimal Degrees = degrees + (minutes/60) + (seconds/3600)

 ;; '(calendar-latitude +28.6)		; New Delhi
 ;; '(calendar-longitude +77.3)
 ;; '(calendar-location-name "New Delhi, India")
 
 ;; '(calendar-latitude +26.9)		; Jaipur
 ;; '(calendar-longitude +75.8)
 '(calendar-latitude [26 52 north])	; vector [deg min north/south]
 '(calendar-longitude [75 46 east])
 '(calendar-location-name "Jaipur, India")
 
 '(calendar-time-zone +330)   ; minutes difference from UTC
 ;; '(calendar-time-zone-style 'numeric)
 ;; '(calendar-standard-time-zone-name "IST")
 ;; '(calendar-daylight-time-zone-name "IST")
 ;; '(display-time-day-and-date t)
 ;; '(display-time-mode t)

 ;; modeline
 '(column-number-mode t)

 ;; TVS keyboard - Hack
 ;; Probably my right and left switches are swapped inside TVS keyboard.
 ;; '(mac-command-modifier 'none)
 ;; '(mac-right-command-modifier 'meta)
 ;; '(mac-option-modifier 'none)
 ;; '(mac-right-option-modifier 'super)
 
 ;; Programming
 '(show-paren-mode t)

 ;; tabs, indent etc
 '(indent-tabs-mode nil)
 '(tab-width 4)
 
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

 ;; semantic
 ;; Enable/disable semantic mode and submodes for various programming
 ;; languages using these two variables:
 ;;
 ;;  -- semantic-new-buffer-setup-functions
 ;;  -- semantic-default-submodes
 ;; '(semantic-default-submodes
 ;;   '(global-semanticdb-minor-mode
 ;;     global-semantic-idle-scheduler-mode
 ;;     global-semantic-idle-summary-mode
 ;;     global-semantic-idle-completions-mode))

 ;; bell
 '(ring-bell-function 'ignore)
 
 ;; browswer
 '(browse-url-browser-function 'eww-browse-url)
 ;; '(shr-color-visible-distance-min 100)
 '(shr-color-visible-luminance-min 70)

 ;; Mime
 '(mailcap-user-mime-data nil)
 
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
      "#postgresql" "##rust" "#rust-embedded" "##aws")
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
     org-mime
     markdown-mode
     kotlin-mode
     gradle-mode
     gnuplot
     plantuml-mode
     flycheck
     flycheck-plantuml
     flycheck-kotlin
     exec-path-from-shell
     eglot
     which-key
     ebdb
     yasnippet
     dockerfile-mode
     docker-compose-mode
     direnv
     diminish
     company)))

(custom-set-faces
 )

(provide 'my-init)
;;; my-init.el ends here
