;;; init-gnus.el --- Gnus configuration -*- lexical-binding: t -*-

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(setq gnus-init-file (expand-file-name "gnus" user-emacs-directory))

;; select account to send email
;; (require 'gnus-select-account)
;; (gnus-select-account-enable)

;; notify
;; (require 'gnus-desktop-notify)
;; (gnus-desktop-notify-mode)
;; (gnus-demon-add-scanmail)

(provide 'init-gnus)
;;; init-gnus.el ends here
