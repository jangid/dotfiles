;;; init-kotlin.el --- kotlin configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

(defun my/kotlin-setup ()
  "Initialize tools require for Kotlin programming."
  (defvar my/pkgs)
  ;; (setq my/pkgs '(kotlin-mode
  ;; 		  lsp-mode
  ;; 		  company
  ;; 		  dap-mode
  ;; 		  flycheck))
  (setq my/pkgs '(kotlin-mode
		  eglot
		  company))
  
  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg))))

  (setenv "JAVA_HOME"
 	  "/Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home")
  (setenv "PATH"
	  (concat "/Users/pankaj/work/code/github/kotlin-language-server/server/build/install/server/bin:" (getenv "PATH")))
  (add-to-list 'exec-path
	       "/Users/pankaj/work/code/github/kotlin-language-server/server/build/install/server/bin")
  
  (require 'company)
  (defvar company-backends)
  (add-to-list 'company-backends 'company-capf)
  ;;(add-hook 'kotlin-mode-hook #'lsp)
  (add-hook 'kotlin-mode-hook #'eglot-ensure)
  (add-hook 'kotlin-mode-hook #'company-mode)
  ;; (add-hook 'kotlin-mode-hook #'dap-mode)
  ;; (add-hook 'kotlin-mode-hook #'flycheck-mode)
  (add-hook 'kotlin-mode-hook #'display-line-numbers-mode)
  (add-hook 'kotlin-mode-hook #'electric-pair-mode)
  (add-hook 'kotlin-mode-hook #'hs-minor-mode)
  (add-hook 'kotlin-mode-hook #'abbrev-mode))

(my/kotlin-setup)

(provide 'init-kotlin)
;;; init-kotlin.el ends here
