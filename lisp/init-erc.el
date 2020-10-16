;;; init-erc.el --- configure ERC -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun connect-freenode ()
  "Connect to irc.freenode.net."
  (interactive)
  (erc :server "irc.freenode.net"
       :port 6667
       :nick "jangid"
       :full-name "Pankaj Jangid"))

(defun connect-gitter ()
  "Connect to irc.gitter.im."
  (interactive)
  (erc-tls :server "irc.gitter.im"
	   :port 6667
	   :nick "jangid"
	   :full-name "Pankaj Jangid"))

;; This causes ERC to connect to the Freenode network upon hitting
;; C-c e f.
(global-set-key "\C-cef" 'connect-freenode)
(global-set-key "\C-ceg" 'connect-gitter)

;; Make C-c RET (or C-c C-RET) send messages instead of RET.
(require 'erc)
(define-key erc-mode-map (kbd "RET") nil)
(define-key erc-mode-map (kbd "C-c RET") 'erc-send-current-line)
(define-key erc-mode-map (kbd "C-c C-RET") 'erc-send-current-line)

;; useful irc channel
;; (setq erc-autojoin-channels-alist
;;       '(("freenode.net"
;; 	 "#emacs" "#erc" "#postgresql" "##rust" "#rust-embedded"
;; 	 "#python" "##javascript" "#docker" "##electronics" "#arduino"
;;       "#arduino-ops" "#sr.ht")))
;; (setq erc-autojoin-channels-alist
;;       '(("#emacs" "#python" "#docker" "#arduino")))

(provide 'init-erc)
;;; init-erc.el ends here
