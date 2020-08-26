;;; init-ruby.el --- ruby configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package eglot
  :ensure t
  :hook
  (ruby-mode . eglot-ensure))

(provide 'init-ruby)
;;; init-ruby.el ends here
