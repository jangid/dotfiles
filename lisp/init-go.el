;;; init-go.el --- go configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package eglot
  ensure: t)

(add-hook 'go-mode-hook #'eglot-ensure)

(provide 'init-go)
;;; init-go.el ends here
