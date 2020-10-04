;;; init-eglot.el --- eglog configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

(defun my/eglot-setup ()
  "Initialize eglot."
  (interactive)
  (defvar my/pkgs '(eglot))

  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (message "installing eglot")
      (dolist (pkg ulist)
	(package-install pkg)))))

(my/eglot-setup)

(provide 'init-eglot)
;;; init-eglot.el ends here
