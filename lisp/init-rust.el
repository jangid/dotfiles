;;; init-rust.el --- rust configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package company
  :ensure t)
(use-package rust-mode
  :ensure t)
(use-package eglot
  :ensure t)
(use-package yasnippet
  :ensure t)
(use-package flymake
  :ensure t)

(defun my/rust-mode-hook ()
  "Custom code to run on start of 'rust-mode'."
  (setq indent-tabs-mode nil))

(add-hook 'rust-mode-hook 'my/rust-mode-hook)
(add-hook 'rust-mode-hook #'company-mode)
(add-hook 'rust-mode-hook #'display-line-numbers-mode)
(add-hook 'rust-mode-hook #'yas-minor-mode)
(add-hook 'rust-mode-hook #'electric-pair-mode)
(add-hook 'rust-mode-hook #'hs-minor-mode)
(add-hook 'rust-mode-hook #'semantic-mode)
(add-hook 'rust-mode-hook #'eglot-ensure)
(add-hook 'js-mode-hook #'flymake-mode)

(provide 'init-rust)
;;; init-rust.el ends here
