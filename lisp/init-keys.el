;;; init-keys.el --- keyboard settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Probably my right and left switches are swapped inside keyboard.

(cond
 ((eq system-type 'darwin)
  (defvar mac-command-modifier 'none)
  (defvar mac-right-command-modifier 'meta)
  (defvar mac-option-modifier 'none)
  (defvar mac-right-option-modifier 'super)
  (setq visible-bell t))
 (t
  (setq visible-bell nil)))

(provide 'init-keys)
;;; init-keys.el ends here
