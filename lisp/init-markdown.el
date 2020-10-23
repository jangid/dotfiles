;;; init-markdown.el --- markdown configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun my/markdown-setup ()
  "Initialize markdown from elpa."
  (defvar my/pkgs '(markdown-mode))
  
  (require 'package)
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
	    (my/markdown-setup)))

(provide 'init-markdown)
;;; init-markdown.el ends here
