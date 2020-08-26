;;; init-javascript.el --- javascript conf -*- lexical-binding: t -*-

;;; Commentary:
;; Install follwoing npm packages for this configuration to work
;; npm install -g tern
;; npm install -g eslint

;;; Code:

(require 'init-use-package)

(use-package company
  :ensure t
  :config
  (use-package tern
    :ensure t
    :config
    (tern-mode t)
    (add-to-list 'company-backends 'company-tern)
    :hook
    (js-mode . company-mode)))

(use-package flymake-eslint
  :ensure t
  :config
  (lambda () (flymake-eslint-enable)))

(eval-when-compile (require 'js))
(add-to-list 'auto-mode-alist '("\\.mjs\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.cjs\\'" . js-mode))

(defun my/js-mode-hook ()
  "Company package isn't loaded during init; hence the lazy function."
  (setq js-indent-level 2)
  (setq-default indent-tabs-mode nil))

(add-hook 'js-mode-hook 'my/js-mode-hook)

(provide 'init-javascript)
;;; init-javascript.el ends here
