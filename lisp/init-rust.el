;;; init-rust.el --- rust configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package rust-mode
  :ensure t)
(use-package eglot
  :ensure t)
(use-package yasnippet
  :ensure t)

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook #'eglot-ensure)

(provide 'init-rust)
;;; init-rust.el ends here
