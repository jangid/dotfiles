;;; init-javascript.el --- javascript conf -*- lexical-binding: t -*-

;;; Commentary:

;; Install follwoing npm packages for this configuration to work
;; npm install -g eslint

;;; Code:

(defun my/js-setup ()
  "Initialize tools require for JavaScript programming."
  (defvar my/pkgs)
  (setq my/pkgs '(tern))
  
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

  (add-to-list 'auto-mode-alist '("\\.mjs\\'" . js-mode))
  (add-to-list 'auto-mode-alist '("\\.cjs\\'" . js-mode))
  (setq indent-tabs-mode nil)

  (defvar js-indent-level)
  (setq js-indent-level 2)

  (declare-function tern-mode "tern.el")
  (add-hook 'js-mode-hook (lambda () (tern-mode t)))
  
  (add-hook 'js-mode-hook #'display-line-numbers-mode)
  (add-hook 'js-mode-hook #'electric-pair-mode)
  (add-hook 'js-mode-hook #'show-paren-mode)
  (add-hook 'js-mode-hook #'hs-minor-mode)
  (add-hook 'js-mode-hook #'abbrev-mode))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (my/js-setup)))

(provide 'init-javascript)
;;; init-javascript.el ends here
