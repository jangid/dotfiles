;;; init-org.el --- configure org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun my/org-extras-setup ()
  "Initialize extras for Org Mode."
  (defvar my/pkgs '(org-mime
		    org-superstar))
  
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
	    (my/org-extras-setup)))

;; Global key bindings
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-switchb)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c f") 'org-footnote-action)

(defun my/org-mode-hook ()
  "Custom code to run on start of 'org-mode'."
  (visual-line-mode)

  (declare-function org-superstar-mode "org-superstar.el")
  (org-superstar-mode)
  (declare-function org-indent-mode "org-indent.el")
  (org-indent-mode)

  (require 'org-tempo)

  (require 'ob-python)
  (require 'ob-C)
  (require 'ob-java)
  (require 'ob-latex)
  (require 'ob-js)
  (require 'ob-css)
  (require 'ob-sed)
  (require 'ob-awk)
  (require 'ob-perl)
  (require 'ob-sql)
  (require 'ob-emacs-lisp))

(add-hook 'org-mode-hook 'my/org-mode-hook)


(provide 'init-org)
;;; init-org.el ends here
