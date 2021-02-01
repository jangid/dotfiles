;;; init_eglot.el --- initialize eglot
;;; Commentary:
;;; Code:

(setq debug-on-error t)

;; Java
(setenv "JAVA_HOME"
        (substring
         (shell-command-to-string "/usr/libexec/java_home -v 11")
         0 -1))
(add-to-list 'exec-path
             (concat (getenv "JAVA_HOME") "/bin"))
(setenv "PATH" (mapconcat 'identity exec-path ":"))

;; Add Eclipse JDT Language Server to CLASSPATH
(require 'cl-lib)
(defun add-to-classpath (item)
  "Add ITEM to CLASSPATH."
  
  (let ((class-path (getenv "CLASSPATH")))
    
    (defvar class-path-list (if class-path
				(split-string class-path ":")))
    (cl-pushnew item class-path-list)
    (setenv "CLASSPATH"
	    (mapconcat 'identity class-path-list ":"))))

(add-to-classpath
 (substring
  (shell-command-to-string
   (format
    "find %s -name 'org.eclipse.equinox.launcher_*jar'"
    (expand-file-name
     "eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins"
     user-emacs-directory)))
  0 -1))

;; use-package and eglot setup
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(eval-when-compile
  (add-to-list 'load-path
           (expand-file-name "use-package" user-emacs-directory))
  (require 'use-package))

(eval-when-compile (package-initialize))

(use-package eglot
  :hook
  ((java-mode . eglot-ensure)))

(provide 'init_eglot)
;;; init_eglot.el ends here
