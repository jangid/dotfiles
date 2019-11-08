;;; init-looks.el --- customize emacs looks -*- lexical-binding: t -*-

(setq inhibit-startup-screen t)

;; theme
(add-hook 'after-init-hook (lambda () (load-theme 'nimbus t)))

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
(global-set-key (kbd "C-x C-b") #'ibuffer-other-window)

;; browser settings eww
(setq browse-url-browser-function 'eww-browse-url)
;; (setq shr-color-visible-distance-min 100)
(setq shr-color-visible-luminance-min 60)

;; cursor
;; (blink-cursor-mode t)
(global-hl-line-mode +1)

;; mode-line
(display-time-mode +1)

(provide 'init-looks)
;;; init-looks.el ends here
