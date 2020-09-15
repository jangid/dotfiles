;;; init-kotlin.el --- kotlin configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package kotlin-mode
  :ensure t
  :config
  (require 'init-prog-common)
  (use-package company
    :ensure t
    :hook
    (kotlin-mode . company-mode))
  (use-package yasnippet
    :ensure t
    :hook
    (kotlin-mode . yas-minor-mode))
  (use-package lsp-mode
    :ensure t
    :hook
    (kotlin-mode . lsp)))

(provide 'init-kotlin)
;;; init-kotlin.el ends here
