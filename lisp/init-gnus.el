;;; init-gnus.el --- configure Gnus -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

;; Configure Gnus
;;(eval-when-compile (require 'gnus))
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
;; (setq sc-auto-fill-region-p nil sc-preferred-header-style 1)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

(provide 'init-gnus)
;;; init-gnus ends here
