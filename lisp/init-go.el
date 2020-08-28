;;; init-go.el --- go configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package go-mode
  :ensure t
  :config
  (use-package eglot
    :ensure t
    :hook
    (go-mode . eglot-ensure)))

(provide 'init-go)
;;; init-go.el ends here
