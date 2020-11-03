;;; init-eudc.el --- macos contacts
;;; Commentary:
;;; Code:

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (when (eq system-type 'darwin)
	      (eval-and-compile (require 'eudcb-macos-contacts))
	      (eudc-macos-contacts-set-server "localhost"))
	    (custom-set-variables
	     '(eudc-server-hotlist '(("" . bbdb)))
	     '(eudc-inline-expansion-servers 'hotlist))
	    (eval-when-compile (require 'message))
	    (define-key message-mode-map
	      (kbd "TAB") 'eudc-expand-inline)))

(provide 'init-eudc)
;;; init-eudc.el ends here
