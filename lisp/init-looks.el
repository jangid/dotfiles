;;; init-looks.el --- customize emacs looks -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (setq inhibit-startup-screen t)
;; (setq initial-scratch-message nil)

;; Disable menu-bar, tool-bar and scroll-bar. What is the use of emacs
;; if you are using these mouseee features.

;; menuBar
;; (menu-bar-mode +1)
;;(menu-bar-mode -1)

;; scrollBar
;; (scroll-bar-mode +1)

;; toolBar
;; (tool-bar-mode +1)
;;(tool-bar-mode -1)

;; tabBar
;; (setq tab-bar-show 1)
;; (tab-bar-mode +1)
;; (tab-bar-mode -1)

;; cursor
;; (blink-cursor-mode t)
;; (global-hl-line-mode +1)

;; (setq default-frame-alist
;;       '((height . 55)
;;  	(width . 169)
;; 	(left . 110)))

(defun modus-theme-toggle ()
  "Toggle between modus-operandi and modus-vivendi themes."
  (interactive)
  (if (member 'modus-operandi custom-enabled-themes)
      (progn
	(disable-theme 'modus-operandi)
	(load-theme 'modus-vivendi t))
    (disable-theme 'modus-vivendi)
    (load-theme 'modus-operandi t)))

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
;; (add-hook 'emacs-startup-hook
;; 	  (lambda()
;; 	    (setq default-frame-alist
;; 		  '((height . 55)
;;   		    (width . 174)
;; 		    (left . 613)
;; 		    (top . 391)
;; 		    (vertical-scroll-bars . nil)
;; 		    (horizontal-scroll-bars . nil)
;; 		    (tool-bar-lines . 0)))))

;; (add-hook 'emacs-startup-hook
;; 	  (lambda ()
;; 	    (menu-bar-mode -1)
;; 	    (tool-bar-mode -1)
;; 	    (scroll-bar-mode -1)))
;;	    (load-theme 'modus-operandi t)))

;; Font
;; (set-fontset-font "fontset-startup" 'devanagari "ITF Devanagari")
;; (set-fontset-font "fontset-startup" 'devanagari "Kohinoor Devanagari")

(provide 'init-looks)
;;; init-looks.el ends here
