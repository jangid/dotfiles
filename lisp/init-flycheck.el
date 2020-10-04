;;; init-flycheck.el --- flycheck configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

(defun my/flycheck-setup ()
  "Initialize tools require for Rust programming."
  (defvar my/pkgs '(flycheck))

  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg)))))

(my/flycheck-setup)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
