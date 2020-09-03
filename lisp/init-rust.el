;;; init-rust.el --- rust configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package rust-mode
  :ensure t
  :init
  (setq indent-tabs-mode nil)
  :config
  (require 'init-prog-common)
  (use-package company
    :ensure t
    :hook
    (rust-mode . company-mode))
  (use-package yasnippet
    :ensure t
    :hook
    (rust-mode . yas-minor-mode))
  (use-package eglot
    :ensure t
    :hook
    (rust-mode . eglot-ensure)))

(provide 'init-rust)
;;; init-rust.el ends here
