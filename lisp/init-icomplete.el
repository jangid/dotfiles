;;; init-icomplete.el --- configure icomplete -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; icomplete-mode or fido-mode
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (icomplete-mode +1)))
;; (fido-mode +1)

(provide 'init-icomplete)
;;; init-icomplete.el ends here
