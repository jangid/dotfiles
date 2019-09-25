;;; init-erc.el --- default configuration for ERC
;;; Commentary:
;;; Code:

(require 'erc)
(require 'erc-join)

;; Load authentication info from an external source.  Put sensitive
;; passwords and the like in here.
(require 'erc-auth (expand-file-name ".erc-auth.el" user-emacs-directory))

(defun connect-irc ()
  (interactive)
  (erc :server erc-server :port erc-port
       :nick erc-nick :password erc-password))

(defun connect-irc-tls ()
  (interactive)
  (erc-tls :server erc-server :port erc-port
       :nick erc-nick :password erc-password))

(defun connect-freenode ()
  (interactive)
  (set-freenode-credentials)
  (connect-irc)
  (unset-credentials))

(defun connect-gitter ()
  (interactive)
  (set-freenode-credentials)
  (erc-tls :server "irc.gitter.im" :port "6697"
       :nick "jangid")
  (unset-credentials))

(defun connect-bitlbee ()
  (interactive)
  (set-freenode-credentials)
  (erc :server "localhost" :port "6667"
       :nick "jangid")
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

(provide 'init-erc)
;;; init-erc.el ends here
