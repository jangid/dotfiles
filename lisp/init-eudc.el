;;; init-eudc.el --- macos contacts
;;; Commentary:
;;; Code:

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (eval-and-compile (require 'eudcb-macos-contacts))
	    (eudc-macos-contacts-set-server "localhost")
	    (eval-when-compile (require 'message))
	    (define-key message-mode-map
	      [(control ?c) (tab)] 'eudc-expand-inline)
	    (eval-when-compile (require 'sendmail))
	      (define-key mail-mode-map
		[(control ?c) (tab)] 'eudc-expand-inline)))

(provide 'init-eudc)
;;; init-eudc.el ends here
