;; init-vars.el --- initialize builtin variables -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:

(require 'dired)
(require 'desktop)

;; use emacs' emulation of ls command; mac doesn't have ls with --dired
(setq dired-use-ls-dired nil)

;; save and restore desktop session
(desktop-save-mode 1)
(add-to-list 'desktop-path (expand-file-name "desktop" user-emacs-directory))
(setq desktop-dirname (expand-file-name "desktop" user-emacs-directory))
(unless (file-exists-p desktop-dirname)
  (make-directory desktop-dirname))

(provide 'init-vars)
;;; init-vars.el ends here
