;;; init-magit.el --- magit configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)
(defun my/magit-setup ()
  "Startup configuration for magit."
  (unless (package-installed-p 'magit)
    (package-install 'magit))

  (declare-function magit-status "magit")
  (declare-function magit-dispatch-popup "magit")
  
  (global-set-key (kbd "C-x g") #'magit-status)
  (global-set-key (kbd "C-x M-g") #'magit-dispatch-popup))

(my/magit-setup)

(provide 'init-magit)
;;; init-magit.el ends here
