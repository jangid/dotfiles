;;; init-gnus.el --- configure Gnus -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

;; Configure Gnus
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

(provide 'init-gnus)
;;; init-gnus ends here
