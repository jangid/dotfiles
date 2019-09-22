;; init-vars.el --- initialize builtin variables -*- lexical-binding: t -*-

;; use emacs' emulation of ls command; mac doesn't have ls with --dired
;; (setq ls-lisp-use-insert-directory-program nil)
(setq dired-use-ls-dired nil)

;; default frame size
;; (setq initial-frame-alist
;;       '((top . 1) (left . 1) (width . 80) (height . 55)))

;; save and restore desktop session 
(desktop-save-mode 1)
(add-to-list 'desktop-path (expand-file-name "desktop" user-emacs-directory))
(setq desktop-dirname (expand-file-name "desktop" user-emacs-directory))
(unless (file-exists-p desktop-dirname)
  (make-directory desktop-dirname))

(provide 'init-vars)
;; end-of init-vars.el
