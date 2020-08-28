;;; init-rust.el --- rust configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package rust-mode
  :ensure t
  :init
  (setq indent-tabs-mode nil)
  :config
  (use-package company
    :ensure t
    :hook
    (rust-mode . company-mode))
  (use-package flymake
    :ensure t)
  (use-package eglot
    :ensure t
    :hook
    (rust-mode . eglot-ensure)))

(provide 'init-rust)
;;; init-rust.el ends here
