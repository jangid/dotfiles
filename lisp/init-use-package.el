;;; init-use-package.el --- use-package conf -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-and-compile
  (prog1 "use-package"
    (setq package-archives
	  '(("melpa" . "https://melpa.org/packages/")
	    ("elpa"   . "https://elpa.gnu.org/packages/")
	    ("nongnu" . "http://elpa.gnu.org/nongnu/")))
    (package-initialize)
    
    (let ((pkgs-all (list 'use-package 'bind-key 'diminish))
	  (pkgs-to-install (list)))

      
      (message "PackagesAll %s" pkgs-all)

      (dolist (pkg pkgs-all)		; prepare list
	(message "checking %s" pkg)
	(unless (package-installed-p pkg)
	  (message "%s not installed." pkg)
	  (push pkg pkgs-to-install)
	  (message "Added to list.")))
      
      (message "PackageToInstall %s" pkgs-to-install)
      
      (unless (null pkgs-to-install)
	  (progn
	    (package-refresh-contents)
	    (dolist (pkg pkgs-to-install)
	      (package-install pkg))))

      (require 'use-package)
      (require 'diminish)
      (require 'bind-key))))

(provide 'init-use-package)
;;; init-use-package.el ends here
