;;; init-company.el --- configure company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package company
  :ensure t
  :hook (rust-mode . company-mode))

(provide 'init-company)
;;; init-company.el ends here
