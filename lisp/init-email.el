;;; init-email.el --- configure Email -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Show categorised group buffer
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; gnus-dired-mode allow multiple files to be selected for attachment
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

;; Configure Citation
(require 'message)
(setq message-cite-style
      '((message-citation-line-function
	 'message-insert-formatted-citation-line)))

(provide 'init-email)
;;; init-email.el ends here
