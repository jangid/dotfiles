;;; init-flymake.el --- flymake configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

(defun my/flymake-setup ()
  "Initialize flymake from elpa."
  (defvar my/pkgs '(flymake))

  (let (ulist)
    (dolist (pkg my/pkgs ulist)
      (unless (package-installed-p pkg)
	(setq ulist (cons pkg ulist))))
    (unless (null ulist)
      (package-refresh-contents)
      (dolist (pkg ulist)
	(package-install pkg)))))

;; (my/flymake-setup)

(require 'flymake)
(global-set-key (kbd "M-n") #'flymake-goto-next-error)
(global-set-key (kbd "M-p") #'flymake-goto-prev-error)

(provide 'init-flymake)
;;; init-flymake.el ends here
