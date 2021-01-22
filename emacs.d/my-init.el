;;; my-init.el --- user customizations
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by user.

 ;; SECTION: calendar, date, time
 
 ;; 1 minute is equal to 60 seconds.  1 degree is equal to 1 hour, that
 ;; is equal to 60 minutes or 3600 seconds.  To calculate decimal
 ;; degrees, we use the DMS to decimal degree formula below:
 ;;
 ;; Decimal Degrees = degrees + (minutes/60) + (seconds/3600)

 ;; '(calendar-latitude 28.6)		; New Delhi
 ;; '(calendar-longitude 77.3)
 ;; '(calendar-location-name "New Delhi, India")
 ;; '(calendar-latitude 26.9)		; Jaipur
 ;; '(calendar-longitude 75.8)
 '(calendar-latitude [26 52 north])
 '(calendar-location-name "Jaipur, India")
 '(calendar-longitude [75 46 east])
 '(calendar-time-zone 330)
 ;; '(calendar-time-zone-style 'numeric))
 ;; '(calendar-standard-time-zone-name "IST")
 ;; '(calendar-daylight-time-zone-name "IST"))
 ;; '(display-time-day-and-date t)
 ;; '(display-time-mode t)

 ;; SECTION: modeline
 '(column-number-mode t)

 ;; TVS keyboard - Hack
 ;; Probably my right and left switches are swapped inside TVS keyboard.
 '(mac-command-modifier 'none)
 '(mac-right-command-modifier 'meta)
 '(mac-option-modifier 'none)
 '(mac-right-option-modifier 'super)
 
 ;; SECTION: Programming
 '(show-paren-mode t)
 
 ;; SECTION: Frame
 '(scroll-bar-mode nil)
 ;; '(vertical-scroll-bar nil t)
 '(tool-bar-mode nil)
 '(frame-resize-pixelwise nil)
 
 ;; SECTION: version control
 '(add-log-dont-create-changelog-file t)

 ;; SECTION dired
 '(dired-use-ls-dired nil)
 '(ls-lisp-use-insert-directory-program nil)

 ;; SECTION semantic
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

 ;; SECTION bell
 '(ring-bell-function 'ignore)
 
 ;; SECTION browswer
 '(browse-url-browser-function 'eww-browse-url)
 ;; '(shr-color-visible-distance-min 100)
 '(shr-color-visible-luminance-min 70)

 ;; SECTION mime
 '(mailcap-user-mime-data nil)
 
 ;; SECTION Auth Source
 '(auth-sources '("~/.authinfo.gpg"))
 
 ;; SECTION erc
 '(erc-prompt-for-password nil)
 '(erc-prompt-for-nickserv-password nil)
 '(erc-use-auth-source-for-nickserv-password t)
 '(erc-autojoin-channels-alist
   '(("freenode.net""#erc" "#emacs")
     ("oftc.net" "#oftc" "#fsci")))

 ;; SECTION EasyPG
 '(epg-pinentry-mode 'loopback)

 ;; SECTION programming
 '(prog-mode-hook
   '(abbrev-mode
     eldoc-mode
     hs-minor-mode
     electric-pair-local-mode
     display-line-numbers-mode))

 ;; SECTION python
 '(python-shell-interpreter "python3")
 '(python-indent-guess-indent-offset-verbose nil)
 
 ;; SECTION Email
 '(mml-secure-openpgp-encrypt-to-self t)
 '(mml-secure-openpgp-signers '("7C956E6FF8587689"))
 '(mml-secure-openpgp-sign-with-sender t)

 '(gnus-init-file "~/.gnus")
 '(gnus-startup-file "~/.newsrc")

 '(send-mail-function 'smtpmail-send-it)

 ;; SECTION: packages
 '(package-selected-packages
   '(rust-mode
     php-mode
     org-mime
     markdown-mode
     kotlin-mode
     gradle-mode
     gnuplot-mode
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
