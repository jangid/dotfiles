;;; init-rust.el --- rust configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package rust-mode
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'display-line-numbers-mode)
  (add-hook 'rust-mode-hook #'electric-pair-local-mode)
  (add-hook 'rust-mode-hook #'show-paren-mode)
  (add-hook 'rust-mode-hook #'hs-minor-mode)
  (add-hook 'rust-mode-hook #'abbrev-mode)
  (declare-function eglot-ensure "eglot")
  (add-hook 'rust-mode-hook #'eglot-ensure))

(provide 'init-rust)
;;; init-rust.el ends here
