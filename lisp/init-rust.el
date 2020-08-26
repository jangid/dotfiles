;;; init-rust.el --- rust configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package company
  :ensure t
  :hook
  (rust-mode . company-mode))

(use-package rust-mode
  :ensure t)

(use-package eglot
  :ensure t
  :hook
  (rust-mode . eglot-ensure))

(use-package flymake
  :ensure t)

(defun my/rust-mode-hook ()
  "Custom code to run on start of 'rust-mode'."
  (setq indent-tabs-mode nil))

(add-hook 'rust-mode-hook 'my/rust-mode-hook)

(provide 'init-rust)
;;; init-rust.el ends here
