;;; init-gnus.el --- Gnus configuration -*- lexical-binding: t -*-

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(setq gnus-init-file (expand-file-name "gnus" user-emacs-directory))

(provide 'init-gnus)
;;; end-of init-gnus.el
