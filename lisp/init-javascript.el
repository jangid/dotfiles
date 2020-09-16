;;; init-javascript.el --- javascript conf -*- lexical-binding: t -*-

;;; Commentary:
;; Install follwoing npm packages for this configuration to work
;; npm install -g eslint

;;; Code:

(require 'package)

(defun my/js-setup ()
  "Initialize tools require for JavaScript programming."
  (defvar my/pkgs)
  (setq my/pkgs '(eglot
		  company
		  flymake-eslint))

  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg))))

  (add-to-list 'exec-path
	       "/usr/local/bin")
  (add-to-list 'auto-mode-alist '("\\.mjs\\'" . js-mode))
  (add-to-list 'auto-mode-alist '("\\.cjs\\'" . js-mode))
  (setq indent-tabs-mode nil)
  (require 'js)
  (setq js-indent-level 2)
  
  
  (require 'company)
  (defvar company-backends)
;;  (add-to-list 'company-backends 'company-capf)
  (add-hook 'js-mode-hook #'eglot-ensure))
  ;; (add-hook 'js-mode-hook #'company-mode)
  ;; (add-hook 'js-mode-hook #'display-line-numbers-mode)
  ;; (add-hook 'js-mode-hook #'electric-pair-mode)
  ;; (add-hook 'js-mode-hook #'hs-minor-mode)
  ;; (add-hook 'js-mode-hook #'abbrev-mode))
;;  (add-hook 'js-mode-hook (lambda () (flymake-eslint-enable))))

(my/js-setup)

(provide 'init-javascript)
;;; init-javascript.el ends here
