;;; init-kotlin.el --- kotlin configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun my/kotlin-setup ()
  "Initialize tools require for Kotlin programming."
  (defvar my/pkgs)
  (setq my/pkgs '(kotlin-mode
		  gradle-mode
		  flycheck-kotlin))
  
  (require 'package)
  (declare-function package-installed-p "package.el")
  
  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg))))

  (declare-function flycheck-mode "flycheck.el")
  (add-hook 'kotlin-mode-hook #'flycheck-mode)
  (add-hook 'kotlin-mode-hook #'display-line-numbers-mode)
  (add-hook 'kotlin-mode-hook #'electric-pair-mode)
  (add-hook 'kotlin-mode-hook #'show-paren-mode)
  (add-hook 'kotlin-mode-hook #'hs-minor-mode)
  (add-hook 'kotlin-mode-hook #'abbrev-mode))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (my/kotlin-setup)))

(provide 'init-kotlin)
;;; init-kotlin.el ends here
