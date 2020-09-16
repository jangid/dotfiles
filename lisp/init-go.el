;;; init-go.el --- go configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package go-mode
  :ensure t
  :config
  (require 'init-prog-common)
  (use-package yasnippet
    :ensure t
    :hook
    (go-mode . yas-minor-mode))
  (use-package eglot
    :ensure t
    :hook
    (go-mode . eglot-ensure)))

(provide 'init-go)
;;; init-go.el ends here
