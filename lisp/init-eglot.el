;;; init-eglot.el --- eglog configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package eglot
  :ensure t
  :hook (rust-mode . eglot-ensure))

(provide 'init-eglot)
;;; init-eglot.el ends here
