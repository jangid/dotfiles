;;; init-keys.el --- keyboard settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (eq system-type 'darwin)
  (custom-set-variables
   '(mac-command-modifier 'meta)
   '(mac-option-modifier 'super)
   ;; '(mac-right-option-modifier nil)
   ;; '(mac-right-command-modifier nil)
   ))

(provide 'init-keys)
;;; init-keys.el ends here
