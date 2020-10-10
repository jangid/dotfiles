;;; init-flycheck.el --- flycheck configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun my/flycheck-setup ()
  "Initialize tools require for Rust programming."
  (defvar my/pkgs '(flycheck))

  (eval-when-compile (require 'package))
  (declare-function package-installed-p "package.el")

  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg)))))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (my/flycheck-setup)))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
