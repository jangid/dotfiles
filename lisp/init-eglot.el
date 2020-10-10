;;; init-eglot.el --- eglog configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun my/eglot-setup ()
  "Initialize eglot."
  (interactive)
  (defvar my/pkgs '(eglot))

  (eval-when-compile (require 'package))
  (declare-function package-installed-p "package.el")

  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (message "installing eglot")
      (dolist (pkg ulist)
	(package-install pkg)))))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (my/eglot-setup)))

(provide 'init-eglot)
;;; init-eglot.el ends here
