;;; init-java.el --- java configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

(defun my/java-setup ()
  "Initialize tools require for Java programming."
  (defvar my/pkgs '(gradle-mode))

  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg))))

  (setenv "JAVA_HOME"
	  (substring
	   (shell-command-to-string "/usr/libexec/java_home -v 1.8")0 -1))

  (setenv "PATH"
	  (concat (getenv "JAVA_HOME") "/bin" ":" (getenv "PATH")))
  
  (add-to-list 'exec-path
   	       (concat (getenv "JAVA_HOME") "/bin"))

  ;; add eclipse.jdt.ls jars
  ;; (setenv "CLASSPATH"
  ;; 	  (concat
  ;; 	   (string-join
  ;; 	    (directory-files
  ;; 	     "/Users/pankaj/.emacs.d/.cache/lsp/eclipse.jdt.ls/plugins"
  ;; 	     t "^org\\.eclipse\\.equinox\\.launcher.*jar$" t) ":")
  ;; 	   ":"
  ;; 	   (getenv "CLASSPATH")))
  
  ;; add jvm jars
  ;; (setenv "CLASSPATH"
  ;; 	  (concat
  ;; 	   (string-join
  ;; 	    (directory-files
  ;; 	     (concat (getenv "JAVA_HOME") "/jre/lib") t ".*.jar$" t) ":")
  ;; 	   ":"
  ;; 	   (getenv "CLASSPATH")))

  (add-hook 'java-mode-hook #'display-line-numbers-mode)
  (add-hook 'java-mode-hook #'electric-pair-mode)
  (add-hook 'java-mode-hook #'hs-minor-mode)
  (add-hook 'java-mode-hook #'abbrev-mode)
  (add-hook 'java-mode-hook (lambda ()
			      (semantic-mode 1)
			      (semantic-idle-scheduler-mode 1)
			      (semantic-idle-summary-mode 1)
			      (semantic-idle-completions-mode 1)
			      (require 'srecode/mode)
			      (srecode-minor-mode 1)
			      (global-ede-mode 1)
			      (ede-enable-generic-projects))))

(my/java-setup)

(provide 'init-java)
;;; init-java.el ends here
