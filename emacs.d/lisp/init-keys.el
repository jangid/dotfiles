;;; init-keys.el --- keyboard settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar mac-command-modifier)
(defvar mac-right-command-modifier)
(defvar mac-option-modifier)
(defvar mac-right-option-modifier)

(cond
 ((eq system-type 'darwin)
  ;; apple keyboard - use command as meta for better ergonimics
  (setq mac-command-modifier 'meta)
  (setq mac-right-command-modifier 'none)
  (setq mac-option-modifier 'super)
  (setq mac-right-option-modifier 'none)

  (setq visible-bell nil))
 (t
  (setq visible-bell nil)))

;; global key bindings
(global-set-key [?\C-x ?\C-b] #'ibuffer-other-window)

(provide 'init-keys)
;;; init-keys.el ends here
