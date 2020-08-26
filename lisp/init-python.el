;;; init-python.el --- python configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package company
  :ensure t)

(use-package flymake-python-pyflakes
  :ensure t
  :init
  (setq flymake-python-pyflakes-executable "flake8")
  :hook
  (python-mode . flymake-python-pyflakes-load)
  (python-mode . flymake-mode))

(defun my/python-mode-hook ()
  "Company package isn't loaded during init; hence the lazy function."
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

(provide 'init-python)
;;; init-python.el ends here
