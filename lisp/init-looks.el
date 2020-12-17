;;; init-looks.el --- customize emacs looks -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

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
(cond
 ((eq system-type 'gnu/linux)
  ;; On Debian, do this
  ;; sudo apt-get install fonts-noto
  (set-fontset-font t 'devanagari "Noto"))
 ((eq system-type 'darwin)
  ;; (set-fontset-font "fontset-startup" 'devanagari "ITF Devanagari")
  ;; (set-fontset-font "fontset-startup" 'devanagari "Kohinoor Devanagari")
  (set-fontset-font t 'devanagari "Kohinoor Devanagari")))

(defun looks-cycle-frame-size ()
  "Cycle frame-size."
  (interactive)

  (let ((width (frame-width))
	(height (frame-height)))

    (cond ((and (eq width 80) (eq height 36))
	   (set-frame-size nil 130 54))
	  ((and (eq width 130) (eq height 54))
	   (set-frame-size nil 174 54))
	  ((and (eq width 174) (eq height 54))
	   (set-frame-size nil 80 36))
	  (t (set-frame-size nil 80 36))) ; default
    
    (message "Frame size: %sx%s" (frame-width) (frame-height))))

(global-set-key (kbd "M-<f11>") 'toggle-frame-fullscreen)
(global-set-key (kbd "M-<f9>") 'looks-cycle-frame-size)

;; show time in non-graphical displays
(if (eq window-system nil)
    (display-time-mode +1))

(provide 'init-looks)
;;; init-looks.el ends here
