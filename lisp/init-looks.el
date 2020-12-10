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

;; Font
;; (set-fontset-font "fontset-startup" 'devanagari "ITF Devanagari")
;; (set-fontset-font "fontset-startup" 'devanagari "Kohinoor Devanagari")

(defun looks-cycle-frame-size ()
  "Cycle frame-size among default, small and big.

0) default - 80x38 (built-in).
1) small - 100x48
2) big - 174x58"

  (interactive)

  (let ((frame (selected-frame))
	(width (frame-width))
	(height (frame-height)))

    (message "%s %s" width height)
    (cond ((and (eq width 80) (eq height 36))
	   (set-frame-size frame 174 56))
	  ((and (eq width 100) (eq height 46))
	   (set-frame-size frame 80 46))
	  ((and (eq width 80) (eq height 46))
	   (set-frame-size frame 80 36))
	  ((and (eq width 174) (eq height 56))
	   (set-frame-size frame 100 56))
	  ((and (eq width 100) (eq height 56))
	   (set-frame-size frame 100 46)))))

(global-set-key (kbd "M-<f11>") 'toggle-frame-fullscreen)
(global-set-key (kbd "M-<f9>") 'looks-cycle-frame-size)

(provide 'init-looks)
;;; init-looks.el ends here
