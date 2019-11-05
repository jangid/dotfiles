;;; init-looks.el --- customize emacs looks -*- lexical-binding: t -*-

;; theme
(setq-default custom-enabled-themes '(sanityinc-tomorrow-bright))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme))))

(add-hook 'after-init-hook 'reapply-themes)

;; Disable menu-bar, tool-bar and scroll-bar. What is the use of emacs
;; if you are using these mouseee features.

(defun enable-mouse-features ()
    "Enable UI features to be used with mouse."
  (menu-bar-mode 1)
  (toggle-scroll-bar 1)
  (tool-bar-mode 1))

(defun disable-mouse-features ()
  "Disable UI features which are used with mouse."
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1))

(disable-mouse-features)
;;(enable-mouse-features)

;; tabs
(tab-bar-mode -1)

;; default to Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; browser settings eww
(setq browse-url-browser-function 'eww-browse-url)
;; (setq shr-color-visible-distance-min 100)
(setq shr-color-visible-luminance-min 60)

;; cursor
;;(blink-cursor-mode t)
(global-hl-line-mode +1)

(provide 'init-looks)
;;; init-looks.el ends here
