;;; init-ruby.el --- ruby configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package eglot
  ensure: t)

(add-hook 'ruby-mode-hook #'eglot-ensure)

(provide 'init-ruby)
;;; init-ruby.el ends here
