;;; init-erc.el --- configure ERC -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (require 'erc-services)
;; (erc-services-mode 1)

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

;; Setup global key bindings to connect to IRC network
(global-set-key (kbd "C-c e f") 'my/erc-connect-freenode)
(global-set-key (kbd "C-c e g") 'my/erc-connect-gitter)
(global-set-key (kbd "C-c e o") 'my/erc-connect-oftc)

;; Join these channels whenever connecting to servers
;; (defvar erc-autojoin-channels-alist
;;   '(("freenode.net" "#emacs" "#erc" "#debian" "#python" "#arduino")
;;     ("oftc.net" "#debian-india" "#fsci")))
(defvar erc-autojoin-channels-alist
  '(("freenode.net" "#erc")))

;; Setup local key bindings i.e. while ERC is active
(add-hook 'erc-mode-hook
	  (lambda ()
	    (local-set-key (kbd "RET") nil)
	    (local-set-key (kbd "C-c RET") 'erc-send-current-line)
	    (local-set-key (kbd "C-c C-RET") 'erc-send-current-line)))

(provide 'init-erc)
;;; init-erc.el ends here
