;;; init-vars.el --- initialize builtin variables -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'dired)
(require 'desktop)

(setq inhibit-startup-screen t)

;; (setq frame-title-format
;;       '((:eval (if (buffer-file-name)
;; 		   (abbreviate-file-name (buffer-file-name))
;; 		 "%b"))))

;; use emacs' emulation of ls command; mac doesn't have ls with --dired
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; save and restore desktop session
(desktop-save-mode 1)
(add-to-list 'desktop-path (expand-file-name "desktop" user-emacs-directory))
(setq desktop-dirname (expand-file-name "desktop" user-emacs-directory))
(unless (file-exists-p desktop-dirname)
  (make-directory desktop-dirname))

;; cursor
;;(blink-cursor-mode t)
;;(global-hl-line-mode t)

;; default email address and full name
(setq user-mail-address	"pankaj.jangid@gmail.com"
      user-full-name "Pankaj Jangid")

(provide 'init-vars)
;;; init-vars.el ends here
