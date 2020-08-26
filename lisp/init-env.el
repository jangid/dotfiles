;;; init-env.el --- set environment -*-lexical-mode: t-*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package exec-path-from-shell
  :ensure t)

(exec-path-from-shell-initialize)

(use-package direnv
  :ensure t)
(add-hook 'after-init-hook 'direnv-mode)

(provide 'init-env)
;;; init-env.el ends here
