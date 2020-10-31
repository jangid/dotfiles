;;; init-python.el --- python configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

(defun my/python-setup ()
  "Initialize tools require for Python programming."
  (defvar my/pkgs '(eglot))

  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg))))


  ;; (setq python-indent-guess-indent-offset-verbose nil)
  (add-hook 'python-mode-hook #'display-line-numbers-mode)
  (add-hook 'python-mode-hook #'hs-minor-mode)
  (add-hook 'python-mode-hook #'abbrev-mode)

  (declare-function eglot-ensure "eglot")
  (add-hook 'python-mode-hook #'eglot-ensure))

(my/python-setup)

(provide 'init-python)
;;; init-python.el ends here
