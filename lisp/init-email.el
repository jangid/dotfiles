;;; init-email.el --- configure Email -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Show categorised group buffer
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; gnus-dired-mode allow multiple files to be selected for attachment
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

;; SMTP
(setq send-mail-function 'smtpmail-send-it)
;;(setq message-send-mail-function 'message-send-mail-with-sendmail)

;;(setq mail-default-headers
;; (defun my/smtp-message-header-setup ()
;;   (message-add-header
;;    (concat "X-Message-SMTP-Method: "
;; 	   (message-fetch-field "From")))
;;          "smtp smtp.gmail.com 587 pankaj.jangid@gmail.com"))
;; (add-hook 'message-header-setup-hook 'my/smtp-message-header-setup)

;; Configure Citation
(defvar message-cite-style)
(setq message-cite-style
      '((message-citation-line-function
	 'message-insert-formatted-citation-line)))

;; (add-hook 'mail-citation-hook 'sc-cite-original)

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
;;   (ietf-drums-parse-address "Sanjay Sahani <sanjay.sahani@op.com>, Deepak G <dk@op.com>")
;;   (ietf-drums-parse-addresses "Sanjay Sahani <sanjay.sahani@op.com>, Deepak G <dk@op.com>")
;;   )
;; (defun my/save-alias ()
;;   "Save the a")
(provide 'init-email)
;;; init-email.el ends here
