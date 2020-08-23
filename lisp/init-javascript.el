;;; init-javascript.el --- javascript conf -*- lexical-binding: t -*-

;;; Commentary:
;; Install follwoing npm packages for this configuration to work
;; npm install -g tern
;; npm install -g eslint

;;; Code:

(require 'init-pkg)

(use-package company
  :ensure t)
(use-package tern
  :ensure t)
(use-package flymake-eslint
  :ensure t)
(use-package yasnippet
  :ensure t)

(eval-when-compile (require 'js))
(add-to-list 'auto-mode-alist '("\\.mjs\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.cjs\\'" . js-mode))

(defun my/js-mode-hook ()
  "Company package isn't loaded during init; hence the lazy function."
  (setq js-indent-level 2)
  (setq-default indent-tabs-mode nil)
  (tern-mode t)
  (flymake-eslint-enable)
  (add-to-list 'company-backends 'company-tern))

(add-hook 'js-mode-hook 'my/js-mode-hook)
(add-hook 'js-mode-hook #'flymake-mode)
(add-hook 'js-mode-hook #'abbrev-mode)

(provide 'init-javascript)
;;; init-javascript.el ends here
