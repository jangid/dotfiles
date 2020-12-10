;;; init-env.el --- env configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package exec-path-from-shell
  :ensure t
  :if window-system
  :init
  (setq exec-path-from-shell-arguments '("-i"))
  :hook
  (emacs-startup . exec-path-from-shell-initialize))

(provide 'init-env)
;;; init-env.el ends here
