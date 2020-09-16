;;; init-java.el --- java configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

(defun my/java-setup ()
  "Initialize tools require for Java programming."
  (defvar my/pkgs)
  (setq my/pkgs '(lsp-mode lsp-java
			   company
			   dap-mode
			   flycheck))

  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg))))

  (setenv "JAVA_HOME"
 	  "/usr/local/Cellar/openjdk/14.0.1")
  
  (require 'company)
  (defvar company-backends)
  (add-to-list 'company-backends 'company-capf)
  (add-hook 'java-mode-hook #'lsp)
  (add-hook 'java-mode-hook #'company-mode)
  (add-hook 'java-mode-hook #'dap-mode)
  (add-hook 'java-mode-hook #'flycheck-mode)
  (add-hook 'java-mode-hook #'display-line-numbers-mode)
  (add-hook 'java-mode-hook #'electric-pair-mode)
  (add-hook 'java-mode-hook #'hs-minor-mode)
  (add-hook 'java-mode-hook #'abbrev-mode))

(my/java-setup)

(provide 'init-java)
;;; init-java.el ends here
