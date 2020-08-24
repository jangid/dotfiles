;;; init-org.el --- configure org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package org
  :ensure t)
(use-package org-bullets
  :ensure t)

;; Global key bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-switchb)

(defun my/org-mode-hook ()
  "Custom code to run on start of 'org-mode'."
  (visual-line-mode)
  (org-indent-mode)
  (org-bullets-mode)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (C . t))))

(add-hook 'org-mode-hook 'my/org-mode-hook)

(provide 'init-org)
;;; init-org.el ends here
