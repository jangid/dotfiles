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
	     '(eudc-inline-expansion-servers 'hotlist))))

(provide 'init-eudc)
;;; init-eudc.el ends here
