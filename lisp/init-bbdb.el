;;; init-bbdb.el --- configure bbdb -*- lexical-binding: t -*-

;;; Commentary:
;; Get help for key bindings

;;; Code:

(defun my/bbdb-install ()
  "Startup configuration for bbdb."
  (defvar my/pkgs '(bbdb))
  
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
	    (progn
	      (my/bbdb-install)
	      (declare-function bbdb-initialize "bbdb.el")
	      (bbdb-initialize 'gnus 'message))))

(provide 'init-bbdb)
;;; init-bbdb.el ends here
