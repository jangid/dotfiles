;;; init-python.el --- python configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package company
  :ensure t)
(use-package flymake-python-pyflakes
  :ensure t)
;;(eval-when-compile (require 'flymake-python-pyflakes))

(defun my/python-mode-hook ()
  "Company package isn't loaded during init; hence the lazy function."
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook #'flymake-mode)
(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook #'abbrev-mode)
(add-hook 'python-mode-hook #'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")
;; (add-hook 'python-mode-hook 'yapf-mode)

(provide 'init-python)
;;; init-python.el ends here
