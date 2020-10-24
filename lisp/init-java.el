;;; init-java.el --- java configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)
(use-package gradle-mode
  :ensure t)
(use-package cc-mode
  :mode
  (("\\.java\\'" . java-mode))
  :config
  (setenv "JAVA_HOME"
	  (substring
	   (shell-command-to-string "/usr/libexec/java_home -v 1.8")0 -1))
  (setenv "PATH"
	  (concat (getenv "JAVA_HOME") "/bin" ":" (getenv "PATH")))
  (add-to-list 'exec-path
   	       (concat (getenv "JAVA_HOME") "/bin"))
  (add-hook 'java-mode-hook #'display-line-numbers-mode)
  (add-hook 'java-mode-hook #'electric-pair-mode)
  (add-hook 'java-mode-hook #'hs-minor-mode)
  (add-hook 'java-mode-hook #'abbrev-mode)
  (add-hook 'java-mode-hook #'semantic-mode))

;;(require 'srecode/mode)
;;(srecode-minor-mode 1)
;;(global-ede-mode 1)
;;(ede-enable-generic-projects))))

(provide 'init-java)
;;; init-java.el ends here
