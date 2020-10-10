;;; init-icomplete.el --- configure icomplete -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; icomplete-mode or fido-mode
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (icomplete-mode t)))
;; (fido-mode t)

(provide 'init-icomplete)
;;; init-icomplete.el ends here
