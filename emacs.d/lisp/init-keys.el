;;; init-keys.el --- keyboard settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Probably my right and left switches are swapped inside keyboard.

(defvar mac-command-modifier)
(defvar mac-right-command-modifier)
(defvar mac-option-modifier)
(defvar mac-right-option-modifier)

(cond
 ((eq system-type 'darwin)
  ;; apple keyboard
  ;; (setq mac-command-modifier 'meta)
  ;; (setq mac-right-command-modifier 'none)
  ;; (setq mac-option-modifier 'super)
  ;; (setq mac-right-option-modifier 'none)
  ;; TVS keyboard
  (setq mac-command-modifier 'none)
  (setq mac-right-command-modifier 'meta)
  (setq mac-option-modifier 'none)
  (setq mac-right-option-modifier 'super)
  (setq visible-bell nil))
 (t
  (setq visible-bell nil)))

(provide 'init-keys)
;;; init-keys.el ends here
