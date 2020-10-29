;;; init-org.el --- configure org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (eval-when-compile (require 'init-use-package))
;; (use-package org
;;   :bind
;;   (("C-c a" . org-agenda)
;;    ("C-c b" . org-switchb)
;;    ("C-c c" . org-capture)
;;    ("C-c l" . org-store-link)
;;    ("C-c f" . org-footnote-action))
;;   :config
;;   (defvar org-agenda-include-diary t)
;;   (add-hook 'org-mode-hook
;; 	    (lambda ()
;; 	      ;; (visual-line-mode)
;; 	      ;; (org-indent-mode)
;; 	      ;; (require 'org-tempo)

;; 	      (require 'ob-python)
;; 	      (require 'ob-C)
;; 	      (require 'ob-java)
;; 	      (require 'ob-latex)
;; 	      (require 'ob-js)
;; 	      (require 'ob-css)
;; 	      (require 'ob-sql)
;; 	      (require 'ob-emacs-lisp))))

(defun my-org-setup ()
  "Organise the Org."

  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c b") 'org-switchb)
  (global-set-key (kbd "C-c c") 'org-capture)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c f") 'org-footnote-action)
  
  (defvar org-agenda-include-diary t)

  (add-hook 'org-mode-hook
	    (lambda ()
	      (visual-line-mode)
	      ;; (org-indent-mode)
	      ;; (require 'org-tempo)
	      
	      (require 'ob-python)
	      (require 'ob-C)
	      (require 'ob-java)
	      (require 'ob-latex)
	      (require 'ob-js)
	      (require 'ob-css)
	      (require 'ob-sql)
	      (require 'ob-emacs-lisp))))

(add-hook 'emacs-startup-hook 'my-org-setup)

(provide 'init-org)
;;; init-org.el ends here
