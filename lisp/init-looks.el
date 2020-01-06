;;; init-looks.el --- customize emacs looks -*- lexical-binding: t -*-

(setq inhibit-startup-screen t)

;; theme
;; (add-hook 'after-init-hook (lambda () (load-theme 'nimbus t)))
(add-hook 'after-init-hook (lambda () (load-theme 'sanityinc-tomorrow-bright t)))

;; Disable menu-bar, tool-bar and scroll-bar. What is the use of emacs
;; if you are using these mouseee features.

;; menuBar
;; (menu-bar-mode +1)
;; (menu-bar-mode -1)

;; scrollBar
;; (scroll-bar-mode +1)
;; (scroll-bar-mode -1)

;; toolBar
;; (tool-bar-mode +1)
;; (tool-bar-mode -1)

;; tabBar
;; (setq tab-bar-show 1)
;; (tab-bar-mode +1)
;; (tab-bar-mode -1)

;; default to Ibuffer
;; (global-set-key (kbd "C-x C-b") #'ibuffer-other-window)
(global-set-key (kbd "C-x C-b") #'ibuffer)

;; browser settings eww
(setq browse-url-browser-function 'eww-browse-url)
;; (setq shr-color-visible-distance-min 100)
(setq shr-color-visible-luminance-min 60)

;; cursor
;; (blink-cursor-mode t)
(global-hl-line-mode +1)

;; mode-line
;; (display-time-mode +1)

(provide 'init-looks)
;;; init-looks.el ends here
