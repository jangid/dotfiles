;;; init-keys.el --- keyboard settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Probably my right and left switches are swapped inside keyboard.

(when (eq system-type 'darwin)
  (setq
   mac-command-modifier 'none
   mac-right-command-modifier 'meta
   mac-option-modifier 'none
   mac-right-option-modifier 'super))

(setq visible-bell nil)

(provide 'init-keys)
;;; init-keys.el ends here
