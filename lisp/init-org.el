;; init-org.el --- org mode configuration -*- lexical-binding: t -*-

(when (package-installed-p 'org)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  (global-set-key (kbd "C-c b") 'org-switchb))

;; (org-babel-do-load-languages
;;  'org-babel-load-languages '((C . t)))

(add-hook 'org-mode-hook (lambda ()
			   (visual-line-mode)
			   (org-indent-mode)
			   (org-bullets-mode)))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (C . t)))

(provide 'init-org)
;;; init-org.el ends here
