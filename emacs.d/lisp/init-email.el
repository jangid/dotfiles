;;; init-email.el --- configure Email -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Make face from JPG using:

;; "djpeg face.jpg | ppmnorm | pnmscale -width 48 -height 48 |
;; ppmquant 7 | pnmtopng > face.png"

;; Now check the size of "face.png" file. It should be less than 725
;; bytes. ref: http://quimby.gnus.org/circus/face/

(defun my/set-face ()
  "Add Face header to email message."
  (interactive)
    (progn
    (declare-function message-add-header "message.el")
    (message-add-header
     (concat "Face: "
	     (gnus-face-from-file "face.png")))))

(defun my/unset-face ()
  "Remove Face field."
  (interactive)
  (progn
    (declare-function message-remove-header "message.el")
    (message-remove-header "Face")))

(provide 'init-email)
;;; init-email.el ends here
