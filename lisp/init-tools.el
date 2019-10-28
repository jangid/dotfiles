;;; init-tools.el --- configure accessories -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Configure Gnus
(setq gnus-init-file (expand-file-name "gnus" user-emacs-directory))
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; Configure ERC

(provide 'init-tools)
;;; init-tools.el ends here
