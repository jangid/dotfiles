;;; init-ruby.el --- ruby configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

(defun my/ruby-setup ()
  "Initialize tools require for Ruby programming."
  (defvar my/pkgs '(eglot))

  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg))))


  (add-hook 'ruby-mode-hook #'display-line-numbers-mode)
  (add-hook 'ruby-mode-hook #'electric-pair-mode)
  (add-hook 'ruby-mode-hook #'hs-minor-mode)
  (add-hook 'ruby-mode-hook #'abbrev-mode)

  (declare-function eglot-ensure "eglot")
  (add-hook 'ruby-mode-hook #'eglot-ensure))

(my/ruby-setup)

(provide 'init-ruby)
;;; init-ruby.el ends here
