;;; init-javascript.el --- javascript conf -*- lexical-binding: t -*-

;;; Commentary:
;; Install follwoing npm packages for this configuration to work
;; npm install -g tern
;; npm install -g eslint

;;; Code:

(require 'init-use-package)

(use-package js
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.mjs\\'" . js-mode))
  (add-to-list 'auto-mode-alist '("\\.cjs\\'" . js-mode))
  :config
  (require 'init-prog-common)
  (setq indent-tabs-mode nil)
  (setq js-indent-level 2)
  (use-package yasnippet
    :ensure t
    :hook
    (js-mode . yas-minor-mode))
  (use-package flymake-eslint
    :ensure t
    :after
    (flymake)
    :config
    (lambda () (flymake-eslint-enable)))
  (use-package company
    :ensure t
    :config
    :hook
    (js-mode . company-mode))
  (use-package eglot
    :ensure t
    :hook
    (js-mode . eglot-ensure)))

(provide 'init-javascript)
;;; init-javascript.el ends here
