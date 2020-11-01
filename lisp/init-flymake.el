;;; init-flymake.el --- flymake configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (defun my/flymake-setup ()
;;   "Initialize flymake from elpa."
;;   (defvar my/pkgs '(flymake))

;;   (eval-when-compile (require 'package))
;;   (declare-function package-installed-p "package")

;;   (let (ulist)
;;     (dolist (pkg my/pkgs ulist)
;;       (unless (package-installed-p pkg)
;; 	(setq ulist (cons pkg ulist))))
;;     (unless (null ulist)
;;       (package-refresh-contents)
;;       (dolist (pkg ulist)
;; 	(package-install pkg)))))

;; (add-hook 'emacs-startup-hook
;; 	  (lambda ()
;; 	    (my/flymake-setup)))

(require 'init-use-package)
(use-package flymake
  :bind
  (("M-n" . flymake-goto-next-error)
   ("M-p" . flymake-goto-prev-error)))

(provide 'init-flymake)
;;; init-flymake.el ends here
