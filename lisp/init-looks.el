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
;; (set-fontset-font "fontset-startup" 'devanagari "ITF Devanagari")
;; (set-fontset-font "fontset-startup" 'devanagari "Kohinoor Devanagari")

(defun looks-cycle-frame-size ()
  "Cycle frame-size among default, small and big.

0) default - 80x38 (built-in).
1) small - 100x48
2) big - 174x58"

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
    ;; (cond ((and (eq width 80) (eq height 36))
    ;; 	   (set-frame-size nil 174 56))
    ;; 	  ((and (eq width 100) (eq height 46))
    ;; 	   (set-frame-size nil 80 46))
    ;; 	  ((and (eq width 80) (eq height 46))
    ;; 	   (set-frame-size nil 80 36))
    ;; 	  ((and (eq width 174) (eq height 56))
    ;; 	   (set-frame-size nil 100 56))
    ;; 	  ((and (eq width 100) (eq height 56))
    ;; 	   (set-frame-size nil 100 46))
    ;; 	  (t (set-frame-size nil 80 36))) ; default
    
    (message "Frame size: %sx%s" (frame-width) (frame-height))))

(global-set-key (kbd "M-<f11>") 'toggle-frame-fullscreen)
(global-set-key (kbd "M-<f9>") 'looks-cycle-frame-size)

;; show time in non-graphical displays
(if (eq window-system nil)
    (display-time-mode +1))

(provide 'init-looks)
;;; init-looks.el ends here
