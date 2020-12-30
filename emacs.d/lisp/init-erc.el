;;; init-erc.el --- configure ERC -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; TODO read nickname, fullname from file
(defun my/erc-connect-freenode ()
  "Connect to irc.freenode.net."
  (interactive)
  (erc :server "irc.freenode.net"
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


;; Setup global key bindings to connect to IRC network
(global-set-key (kbd "C-c e f") 'my/erc-connect-freenode)
(global-set-key (kbd "C-c e g") 'my/erc-connect-gitter)


;; Setup local key bindings i.e. while ERC is active
(add-hook 'erc-mode-hook
	  (lambda ()
	    (local-set-key (kbd "RET") nil)
	    (local-set-key (kbd "C-c RET") 'erc-send-current-line)
	    (local-set-key (kbd "C-c C-RET") 'erc-send-current-line)))

;; Some useful irc channel
;; freenode.net"
;; "#emacs" "#erc" "#postgresql" "##rust" "#rust-embedded"
;; "#python" "##javascript" "#docker" "##electronics" "#arduino"
;; "#arduino-ops" "#sr.ht")))

(provide 'init-erc)
;;; init-erc.el ends here
