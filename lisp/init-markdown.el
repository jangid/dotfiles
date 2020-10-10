;;; init-markdown.el --- markdown configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)
(declare-function package-installed-p "package.el")

(defun my/markdown-setup ()
  "Initialize markdown from elpa."
  (defvar my/pkgs '(markdown-mode))
  
  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg)))))

(my/markdown-setup)

(provide 'init-markdown)
;;; init-markdown.el ends here
