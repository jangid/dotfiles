;;; init-rust.el --- rust configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun my/rust-setup ()
  "Initialize tools require for Rust programming."
  (defvar my/pkgs '(rust-mode
		    eglot))

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


  (add-hook 'rust-mode-hook #'display-line-numbers-mode)
  (add-hook 'rust-mode-hook #'electric-pair-mode)
  (add-hook 'rust-mode-hook #'show-paren-mode)
  (add-hook 'rust-mode-hook #'hs-minor-mode)
  (add-hook 'rust-mode-hook #'abbrev-mode)

  (declare-function eglot-ensure "eglot")
  (add-hook 'rust-mode-hook #'eglot-ensure))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (my/rust-setup)))

(provide 'init-rust)
;;; init-rust.el ends here
