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

(defvar my/smtp-alist)
(setq my/smtp-alist
      '(("pankaj.jangid@gmail.com"
	 .
	 "smtp smtp.gmail.com 587 pankaj.jangid@gmail.com")
	("pankaj@optimizory.com"
	 .
	 "smtp smtp.gmail.com 587 pankaj.jangid@optimizory.com")
	("pankaj@codeisgreat.org"
	 .
	 "smtp smtp.gmail.com 587 pankaj.jangid@codeisgreat.com")
	("editor@seemasanghosh.org"
	 .
	 "smtp smtp.gmail.com 587 seemasanghosh@gmail.com")
	("pankaj.jangid@atlassiancommunity.com"
	 .
	 "smtp smtp.gmail.com 587 pankaj.jangid@atlassiancommunity.com")
	("pankaj.jangid@moneyraam.com"
	 .
	 "smtp smtp.gmail.com 587 pankaj.jangid@moneyraam.com")
	("pankaj@jangid.info"
	 .
	 "smtp smtp.gmail.com 587 pankaj@jangid.info")
	("pankaj.jangid@gmail.com"
	 .
	 "smtp smtp.gmail.com 587 pankaj.jangid@gmail.com")
	("pankaj.jangid@gmail.com"
	 .
	 "smtp smtp.gmail.com 587 pankaj.jangid@gmail.com")
	("p4j@j4d.net"
	 .
         "smtp smtp.zoho.in 587 p4j@j4d.net")
	("pankaj.jangid@outlook.com"
	 .
         "smtp smtp.office365.com 587 pankaj.jangid@outlook.com")))

(defun my/fix-smtp ()
  "Fix SMTP as per FROM field."
  (interactive)
  (declare-function message-add-header "message.el")
  (declare-function message-fetch-field "message.el")
  (declare-function ietf-drums-parse-address "ietf-drums.el")
  (message-add-header
   (concat "X-Message-SMTP-Method: "
	   (cdr
	    (assoc
	     (car
	      (ietf-drums-parse-address
	       (message-fetch-field "From")))
	     my/smtp-alist)))))
(add-hook 'message-header-setup-hook 'my/fix-smtp)

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
;; (car (ietf-drums-parse-address "Sanjay Sahani <sanjay.sahani@op.com>"))
;;  (ietf-drums-parse-addresses "Sanjay Sahani <sanjay.sahani@op.com>, Deepak G <dk@op.com>")
;;   )
;; (defun my/save-alias ()
;;   "Save the a")
(provide 'init-email)
;;; init-email.el ends here
