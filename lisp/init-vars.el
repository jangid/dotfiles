;; init-vars.el --- initialize builtin variables -*- lexical-binding: t -*-

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
;; (setq dired-use-ls-dired nil)
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; save and restore desktop session
(desktop-save-mode 1)
(add-to-list 'desktop-path (expand-file-name "desktop" user-emacs-directory))
(setq desktop-dirname (expand-file-name "desktop" user-emacs-directory))
(unless (file-exists-p desktop-dirname)
  (make-directory desktop-dirname))

;; cursor
(blink-cursor-mode t)
(global-hl-line-mode t)

;; default email address and full name
(setq user-mail-address	"pankaj.jangid@gmail.com"
      user-full-name "Pankaj Jangid")

(add-hook 'text-mode-hook #'flyspell-mode)

;; browser settings
;; (setq browse-url-browser-function 'w3m-browse-url)
(setq browse-url-browser-function 'eww-browse-url)
;;(setq shr-color-visible-distance-min 100)
(setq shr-color-visible-luminance-min 60)


;; (defun my/eww-toggle-images ()
;;   "Toggle whether images are loaded and reload the current page fro cache."
;;   (interactive)
;;   (setq-local shr-inhibit-images (not shr-inhibit-images))
;;   (eww-reload t)
;;   (message "Images are now %s"
;;            (if shr-inhibit-images "off" "on")))

;; (require 'eww)
;; (define-key eww-mode-map (kbd "I") #'my/eww-toggle-images)
;; (define-key eww-link-keymap (kbd "I") #'my/eww-toggle-images)

;; ;; minimal rendering by default
;; (setq-default shr-inhibit-images t)   ; toggle with `I`
;; (setq-default shr-use-fonts nil)      ; toggle with `F`

(provide 'init-vars)
;;; init-vars.el ends here
