;;; init-which-key.el --- configure which-key -*- lexical-binding: t -*-

;;; Commentary:
;; Get help for key bindings

;;; Code:

(defun my/which-key-setup ()
  "Startup configuration for which-key."
  (defvar my/pkgs '(which-key))
  
  (eval-when-compile (require 'package))
  (declare-function package-installed-p "package.el")

  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg))))

  ;; (add-to-list 'load-path (expand-file-name
  ;; 			   "emacs-which-key"
  ;; 			   user-emacs-directory))
  (declare-function which-key-mode "which-key")
  (which-key-mode 1))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (my/which-key-setup)))

(provide 'init-which-key)
;;; init-which-key.el ends here
