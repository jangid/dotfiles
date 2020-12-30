;;; init-looks.el --- customize emacs looks -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Themes

(defun modus-theme-toggle ()
  "Toggle between modus-operandi and modus-vivendi themes."
  (interactive)
  (if (member 'modus-operandi custom-enabled-themes)
      (progn
	(disable-theme 'modus-operandi)
	(load-theme 'modus-vivendi t))
    (disable-theme 'modus-vivendi)
    (load-theme 'modus-operandi t)))

(when (window-system)
  (load-theme 'modus-operandi))

;; Font

(cond
 ((eq system-type 'gnu/linux)
  ;; On Debian, do this
  ;; sudo apt-get install fonts-noto
  (set-fontset-font t 'devanagari "Noto"))
 ((eq system-type 'darwin)
  ;; (set-fontset-font "fontset-startup" 'devanagari "ITF Devanagari")
  ;; (set-fontset-font "fontset-startup" 'devanagari "Kohinoor Devanagari")
  (set-fontset-font t 'devanagari "Kohinoor Devanagari")))


;; Frame Size

(defun looks-cycle-frame-size ()
  "Cycle frame-size."
  (interactive)

  (let ((width (frame-width))
	(height (frame-height)))

    (cond ((and (eq width 80) (eq height 36))
	   (set-frame-size nil 120 46))
	  ((and (eq width 120) (eq height 46))
	   (set-frame-size nil 160 56))
	  ((and (eq width 160) (eq height 56))
	   (set-frame-size nil 80 36))
	  (t (set-frame-size nil 80 36))) ; default
    
    (message "Frame size: %sx%s" (frame-width) (frame-height))))

(when (eq system-type 'darwin)
  (global-set-key (kbd "M-<f11>") 'toggle-frame-fullscreen))
(global-set-key (kbd "M-<f9>") 'looks-cycle-frame-size)

;; Clock

(display-time-mode +1)

;; Cursor
(setq visible-cursor nil)		; this works on text terminal only
(setq x-stretch-cursor t)		; on GUIs, cursor width equals that
					; of characters

(provide 'init-looks)
;;; init-looks.el ends here
