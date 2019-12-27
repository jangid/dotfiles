;;; init-tools.el --- configure accessories -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Recent files
(recentf-mode 1)

;; GnuPG configuration
(setq epg-pinentry-mode 'loopback)

;; Configure Gnus
(setq gnus-init-file (expand-file-name "gnus" user-emacs-directory))
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
;; use ; on a message to invoke bbdb interactively
(add-hook
 'gnus-summary-mode-hook
 (lambda ()
   (define-key gnus-summary-mode-map (kbd ";") 'bbdb-mua-edit-field)))
;; (setq sc-auto-fill-region-p nil sc-preferred-header-style 1)
;; (setq gnus-use-dribble-file nil)
;; (setq gnus-always-read-dribble-file t)
(setq mml-secure-openpgp-encrypt-to-self t)

;; Configure ERC
(require 'erc)
(require 'erc-join)

;; Authentication
(require 'erc-auth (expand-file-name ".erc-auth.el" user-emacs-directory))

(defun connect-irc ()
  "Connect to IRC."
  (interactive)
  (erc :server erc-server :port erc-port
       :nick erc-nick :password erc-password))

(defun connect-irc-tls ()
  "Connect to IRC using SSL."
  (interactive)
  (erc-tls :server erc-server :port erc-port
       :nick erc-nick :password erc-password))

(defun connect-freenode ()
  "Connect to irc.freenode.net."
  (interactive)
  (set-freenode-credentials)
  (connect-irc)
  (unset-credentials))

(defun connect-gitter ()
  "Connect to irc.gitter.im."
  (interactive)
  (set-gitter-credentials)
  (connect-irc-tls)
  (unset-credentials))

(defun connect-bitlbee ()
  "Connect to bitlbee localhost."
  (interactive)
  (set-bitlbee-credentials)
  (connect-irc)
  (unset-credentials))

;; This causes ERC to connect to the Freenode network upon hitting
;; C-c e f.
(global-set-key "\C-cef" 'connect-freenode)

;; This causes ERC to connect to the Gitter network upon hitting
;; C-c e f.
(global-set-key "\C-ceg" 'connect-gitter)

;; This causes ERC to connect to the IRC server on your own machine (if
;; you have one) upon hitting C-c e b.  Replace MYNICK with your IRC
;; nick.  Often, people like to run bitlbee (http://bitlbee.org/) as an
;; AIM/Jabber/MSN to IRC gateway, so that they can use ERC to chat with
;; people on those networks.
(global-set-key "\C-ceb" 'connect-bitlbee)

;; Make C-c RET (or C-c C-RET) send messages instead of RET.
(define-key erc-mode-map (kbd "RET") nil)
(define-key erc-mode-map (kbd "C-c RET") 'erc-send-current-line)
(define-key erc-mode-map (kbd "C-c C-RET") 'erc-send-current-line)

;; Join the #emacs and #erc channels whenever connecting to Freenode.
(setq erc-autojoin-channels-alist
      '(("freenode.net"
	 "#emacs" "#erc" "#postgresql" "##rust" "#rust-embedded"
	 "#python")))

;; fake-ido. fido-mode also enables icomplete-mode.
;; now only icomplete-mode enabled.
(icomplete-mode +1)

;; bbdb
(bbdb-initialize 'gnus 'message)
(bbdb-mua-auto-update-init 'gnus 'message)
(setq bbdb-mua-pop-up nil)
(setq bbdb-mua-update-interactive-p '(query . create))
(setq bbdb-message-all-addresses t)
(setq bbdb-north-american-phone-numbers-p nil)
(setq bbdb-user-mail-names
      (regexp-opt '("p4j@j4d.net"
		    "pankaj.jangid@gmail.com"
		    "pankaj.jangid@optimizory.com")))

;; org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-switchb)

(add-hook
 'org-mode-hook
 (lambda ()
   (visual-line-mode)
   ;; (org-indent-mode)
   (org-bullets-mode)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (C . t)))

;; ispell - this requires 'ispell' tool to be in path
(add-hook 'text-mode-hook #'flyspell-mode)

;; projectile
(require 'projectile) ;; this required despite package-initialize. Not sure why.
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
;; (setq projectile-project-search-path '("~/work/code/"))

;; use emacs' emulation of ls command; mac doesn't have ls with --dired
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; launch treemacs
(global-set-key [f8] 'treemacs)

(provide 'init-tools)
;;; init-tools.el ends here
