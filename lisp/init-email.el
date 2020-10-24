;;; init-email.el --- configure Email -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Show categorised group buffer
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; gnus-dired-mode allow multiple files to be selected for attachment
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

;; Signature
(defvar message-signature nil)
(defvar message-signature-directory
  "~/.signature_dir")
(defvar message-signature-file
  (expand-file-name "default" message-signature-directory))

;; SMTP
(setq send-mail-function 'smtpmail-send-it)

(defun my/get-smtp ()
  "Get SMTP for as per FROM field."
  (interactive)
  (defvar my/smtp-alist-file (locate-user-emacs-file "my-SMTPs"))
  (let ((filename my/smtp-alist-file))
    (defvar my/smtp-alist)
    (setq my/smtp-alist
          (when (file-exists-p filename)
            (with-temp-buffer
              (insert-file-contents filename)
              (read (current-buffer)))))

    (if (seq-every-p
             (lambda (elt) (stringp (car-safe elt)))
             my/smtp-alist)
	(progn
	  (declare-function message-fetch-field "message.el")
	  (declare-function ietf-drums-parse-address "ietf-drums.el")
	  (cdr
	   (assoc
	    (car
	     (ietf-drums-parse-address
	      (message-fetch-field "From")))
	    my/smtp-alist)))
      (warn "Contents of %s are in wrong format."
            my/smtp-alist-file))))

(defun my/set-smtp ()
  "Set SMTP field as per FROM field."
  (interactive)
  (progn
    (declare-function message-add-header "message.el")
    (message-add-header
     (concat "X-Message-SMTP-Method: "
	     (my/get-smtp)))))

(defun my/unset-smtp ()
  "Remove -X-Message-SMTP-Method field."
  (interactive)
  (progn
    (declare-function message-remove-header "message.el")
    (message-remove-header "X-Message-SMTP-Method")))

(add-hook 'message-setup-hook 'my/set-smtp)

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

(defun my/set-gcc ()
  "Set archive group."
  (interactive)
  ;;Gcc: nnfolder+archive:sent.2020-10
  (progn
    (declare-function message-add-header "message.el")
    (defvar gnus-message-archive-group)
    (message-add-header
     (concat "Gcc: "
	     (format-time-string "sent.%Y-%m")))))

;; (make-temp-file
;;  (expand-file-name "invite-" temporary-file-directory)
;;  nil
;;  ".ics")

;; Configure Citation
;; (defvar message-cite-style)
;; (setq message-cite-style
;;       '((message-citation-line-function
;; 	 'message-insert-formatted-citation-line)))

;; Configure search index
(defun my/timestamp-me (process event)
  "Record EVENT in the PROCESS buffer."
  (print (format "%s %s at %s" process event (current-time-string))
	 (process-buffer process)))

(defun my/notmuch-new ()
  "Execute 'notmuch new' command and logs in buffer *Notmuch*."
  (set-process-sentinel
   (start-process "notmuch" "*Notmuch*" "notmuch" "new")
   'my/timestamp-me))

;; (setq message-signature-directory "~/.signatures")
;; Fetch addresses from headers
;; (defun my/fetch-addresses ()
;;   "Fetch email addresses from the email headers."
;;   (message-fetch-field)
;;   (message-narrow-to-headers-or-head)
;; (car (ietf-drums-parse-address "Sanjay Sahani <sanjay.sahani@op.com>"))
;;  (ietf-drums-parse-addresses "Sanjay Sahani <sanjay.sahani@op.com>, Deepak G <dk@op.com>")
;;   )
;; (defun my/save-alias ()
;;   "Save the a")
(provide 'init-email)
;;; init-email.el ends here
