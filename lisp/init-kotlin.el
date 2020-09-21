;;; init-kotlin.el --- kotlin configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

(defun my/kotlin-setup ()
  "Initialize tools require for Kotlin programming."
  (defvar my/pkgs)
  (setq my/pkgs '(kotlin-mode
		  gradle-mode))
  
  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg))))

;; (setenv "JAVA_HOME"
;; 	(substring
;; 	 (shell-command-to-string "/usr/libexec/java_home -v 1.8")0 -1))

;; (add-to-list 'exec-path
;;    	     (concat (getenv "JAVA_HOME") "/bin"))
;; (add-to-list 'exec-path
;; 	     "/Users/pankaj/work/code/github/kotlin-language-server/server/build/install/server/bin")

;; add kotlin jars
;; (setenv "CLASSPATH"
;; 	(concat
;; 	 (string-join
;; 	  (directory-files
;; 	   "/Users/pankaj/.sdkman/candidates/kotlin/current/lib" t ".*.jar$" t) ":")
;; 	 ":"
;; 	 (getenv "CLASSPATH")))

;; add gradle jars
;; (setenv "CLASSPATH"
;; 	(concat
;; 	 (string-join
;; 	  (directory-files
;; 	   "/Users/pankaj/.sdkman/candidates/gradle/current/lib" t ".*.jar$" t) ":")
;; 	 ":"
;; 	 (getenv "CLASSPATH")))

;; (setenv "PATH"
;; 	(concat (getenv "JAVA_HOME") "/bin" ":" (getenv "PATH")))
;; (setenv "PATH"
;; 	(concat "/Users/pankaj/work/code/github/kotlin-language-server/server/build/install/server/bin:" (getenv "PATH")))
  
;; (add-hook 'kotlin-mode-hook #'dap-mode)
;; (add-hook 'kotlin-mode-hook #'flycheck-mode)
;; (with-eval-after-load 'flycheck
;; (flycheck-gradle-setup))

;; (add-hook 'kotlin-mode-hook #'lsp)
;; (add-hook 'kotlin-mode-hook
;; 	  (lambda ()
;; 	    (require 'lsp-diagnostics)
;; 	    (defvar lsp-diagnostic-package)
;; 	    (setq lsp-diagnostic-package :none)))
(add-hook 'kotlin-mode-hook #'display-line-numbers-mode)
(add-hook 'kotlin-mode-hook #'electric-pair-mode)
(add-hook 'kotlin-mode-hook #'hs-minor-mode)
(add-hook 'kotlin-mode-hook #'abbrev-mode))

(my/kotlin-setup)

(provide 'init-kotlin)
;;; init-kotlin.el ends here
