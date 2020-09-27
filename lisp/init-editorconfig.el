;;; init-editorconfig.el --- configure editors -*- lexical-binding: t -*-

;;; Commentary:
;; Maintain consistent coding style

;;; Code:

(require 'package)

(defun my/editorconfig-setup ()
  "Startup configuration for editorconfig."

  (defvar my/pkgs '(editorconfig))
  
  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg)))))

(my/editorconfig-setup)

(provide 'init-editorconfig)
;;; init-editorconfig.el ends here
