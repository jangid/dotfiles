;;; init-javascript.el --- javascript conf -*- lexical-binding: t -*-

;;; Commentary:

;; Install follwoing npm packages for this configuration to work
;; npm install -g eslint

;;; Code:

(eval-when-compile (require 'init-use-package))

;; (use-package tern
;;   :ensure t
;;   :config
;;   (declare-function tern-mode "tern.el")
;;   (add-hook 'js-mode-hook (lambda () (tern-mode t))))

(use-package js
  :mode
  (("\\.mjs\\'" . js-mode)
   ("\\.cjs\\'" . js-mode)
   ("\\.js\\'" . js-mode))
  :config
  (setq indent-tabs-mode nil)
  (defvar js-indent-level)
  (setq js-indent-level 2)
  (add-hook 'js-mode-hook 'eglot-ensure)
  (add-hook 'js-mode-hook #'display-line-numbers-mode)
  (add-hook 'js-mode-hook #'hs-minor-mode)
  (add-hook 'js-mode-hook #'abbrev-mode))

(provide 'init-javascript)
;;; init-javascript.el ends here
