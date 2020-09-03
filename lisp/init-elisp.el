;;; init-rust.el --- rust configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)
(require 'init-prog-common)

(use-package company
  :ensure t
  :hook
  (emacs-lisp-mode . company-mode))

(add-hook 'emacs-lisp-mode-hook #'flymake-mode)

(provide 'init-elisp)
;;; init-elisp.el ends here
