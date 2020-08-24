;;; init-looks.el --- customize emacs looks -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(setq inhibit-startup-screen t)

;; Disable menu-bar, tool-bar and scroll-bar. What is the use of emacs
;; if you are using these mouseee features.

;; menuBar
;; (menu-bar-mode +1)
(menu-bar-mode -1)

;; scrollBar
;; (scroll-bar-mode +1)
(scroll-bar-mode -1)

;; toolBar
;; (tool-bar-mode +1)
(tool-bar-mode -1)

;; tabBar
;; (setq tab-bar-show 1)
;; (tab-bar-mode +1)
;; (tab-bar-mode -1)

;; cursor
;; (blink-cursor-mode t)
;; (global-hl-line-mode +1)

;; mode-line
;; (display-time-mode +1)

(provide 'init-looks)
;;; init-looks.el ends here
