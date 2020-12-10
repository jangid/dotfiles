;;; init-org.el --- configure org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package org
  :bind
  (("C-c a" . org-agenda)
   ("C-c b" . org-switchb)
   ("C-c c" . org-capture)
   ("C-c l" . org-store-link))
  :hook
  ((message-mode . orgtbl-mode))
  :config
  (add-hook 'org-mode-hook
	    (lambda ()
	      (declare-function org-indent-mode "org.el")
	      (org-indent-mode +1)
	      
	      (require 'ob-python)
	      (require 'ob-C)
	      (require 'ob-java)
	      (require 'ob-latex)
	      (require 'ob-js)
	      (require 'ob-css)
	      (require 'ob-sql)
	      (require 'ob-emacs-lisp)
	      (defvar org-plantuml-jar-path "/usr/local/opt/libexec/plantuml.jar")
	      (require 'ob-plantuml)))

  (defvar org-agenda-include-diary t)
  (defvar org-directory "~/Documents/org")
  (defvar org-agenda-files
    (mapcar
     (lambda (x)
       (concat org-directory "/" x))
     '("notes.org"
       "gtd.org"
       "optimizory.org"
       "personal.org"
       "j4d.org"
       "social.org")))
  (defvar org-capture-templates
    '(("t" "Todo" entry (file+headline "notes.org" "Tasks")
       "* TODO %?\n %i")
      ("T" "Tickler" entry (file+headline "gtd.org" "Ticklers")
       "* TODO %?\n %U\n %i")))
  (defvar org-refile-targets
    `((,(concat org-directory "/gtd.org") :maxlevel . 3)
      (,(concat org-directory "/optimizory.org") :maxlevel . 3)
      (,(concat org-directory "/personal.org") :maxlevel . 3)
      (,(concat org-directory "/j4d.org") :maxlevel . 3)
      (,(concat org-directory "/social.org") :maxlevel . 3)
      (,(concat org-directory "/someday.org") :level . 1)))
  (defvar org-todo-keywords
    '((sequence "TODO(t)"
		"NEXT(n)"
		"WAITING(w)"
		"|"
		"DONE(d)"
		"CANCELLED(c)"))))
  
  ;; (add-hook 'org-mode-hook
  ;; 	    (lambda ()
  ;; 	      ;(visual-line-mode +1)
  ;; 	      (declare-function org-indent-mode "org.el")
  ;; 	      (org-indent-mode +1)
  ;; 	      ;; (require 'org-tempo)

  ;; 	      (require 'ob-python)
  ;; 	      (require 'ob-C)
  ;; 	      (require 'ob-java)
  ;; 	      (require 'ob-latex)
  ;; 	      (require 'ob-js)
  ;; 	      (require 'ob-css)
  ;; 	      (require 'ob-sql)
  ;; 	      (require 'ob-plantuml)
  ;; 	      (require 'ob-emacs-lisp))))
  
;; (eval-when-compile (require 'org))

;; (defun my-org-agenda-skip-all-siblings-but-first ()
;;   "Skip all but the first non-done entry."
;;   (let (should-skip-entry)
;;     (unless (org-current-is-todo)
;;       (setq should-skip-entry t))
;;     (save-excursion
;;       (while (and (not should-skip-entry) (org-goto-sibling t))
;;         (when (org-current-is-todo)
;;           (setq should-skip-entry t))))
;;     (when should-skip-entry
;;       (or (outline-next-heading)
;;           (goto-char (point-max))))))
		  
;; (defun org-current-is-todo ()
;;   "Check if the currect node is in todo state."
;;   (string= "TODO" (org-get-todo-state)))

;; (defun my-org-setup ()
;;   "Organise the Org."
;;   (interactive)
;;   (global-set-key (kbd "C-c a") 'org-agenda)
;;   (global-set-key (kbd "C-c b") 'org-switchb)
;;   (global-set-key (kbd "C-c c") 'org-capture)
;;   (global-set-key (kbd "C-c l") 'org-store-link)
  
;;   (custom-set-variables
;;    '(org-agenda-include-diary t)
;;    '(org-directory "~/Documents/org")
;;    '(org-agenda-files
;;      (mapcar
;;       (lambda (x)
;; 	(concat org-directory "/" x))
;;       '("notes.org"
;; 	"gtd.org"
;; 	"optimizory.org"
;; 	"personal.org"
;; 	"j4d.org"
;; 	"social.org")))
;;    '(org-capture-templates
;;      '(("t" "Todo" entry (file+headline "notes.org" "Tasks")
;; 	"* TODO %?\n %i")
;;        ("T" "Tickler" entry (file+headline "gtd.org" "Ticklers")
;; 	"* TODO %?\n %U\n %i")))
;;    '(org-refile-targets
;;      `((,(concat org-directory "/gtd.org") :maxlevel . 3)
;;        (,(concat org-directory "/optimizory.org") :maxlevel . 3)
;;        (,(concat org-directory "/personal.org") :maxlevel . 3)
;;        (,(concat org-directory "/j4d.org") :maxlevel . 3)
;;        (,(concat org-directory "/social.org") :maxlevel . 3)
;;        (,(concat org-directory "/someday.org") :level . 1)))
;;    '(org-todo-keywords
;;      '((sequence "TODO(t)"
;; 		 "NEXT(n)"
;; 		 "WAITING(w)"
;; 		 "|"
;; 		 "DONE(d)"
;; 		 "CANCELLED(c)")))
;;    ;; '(org-agenda-custom-commands
;;    ;;   '(("o" "At Optimzory" tags-todo "@optimizory"
;;    ;; 	((org-agenda-overriding-header "Optimizory:")
;;    ;;       (org-agenda-skip-function
;;    ;;        #'my-org-agenda-skip-all-siblings-but-first)))
;;    ;;     ("j" "At J4D" tags-todo "@j4d"
;;    ;;      ((org-agenda-overriding-header "J4D:")
;;    ;;       (org-agenda-skip-function
;;    ;;        #'my-org-agenda-skip-all-siblings-but-first)))
;;    ;;     ("h" "At Home" tags-todo "@home"
;;    ;;      ((org-agenda-overriding-header "Home and Personal:")
;;    ;;       (org-agenda-skip-function
;;    ;;        #'my-org-agenda-skip-all-siblings-but-first)))
;;    ;;     ("f" "At FSF" tags-todo "@fsf"
;;    ;;      ((org-agenda-overriding-header "FSF:")
;;    ;;       (org-agenda-skip-function
;;    ;;        #'my-org-agenda-skip-all-siblings-but-first)))
;;    ;;     ("n" "Agenda and all TODOs"
;;    ;; 	((agenda "")
;;    ;; 	 (alltodo "")))))
;;    '(org-plantuml-jar-path "/usr/local/opt/libexec/plantuml.jar"))
  
;;   (add-hook 'org-mode-hook
;; 	    (lambda ()
;; 	      ;(visual-line-mode +1)
;; 	      (declare-function org-indent-mode "org.el")
;; 	      (org-indent-mode +1)
;; 	      ;; (require 'org-tempo)

;; 	      (require 'ob-python)
;; 	      (require 'ob-C)
;; 	      (require 'ob-java)
;; 	      (require 'ob-latex)
;; 	      (require 'ob-js)
;; 	      (require 'ob-css)
;; 	      (require 'ob-sql)
;; 	      (require 'ob-plantuml)
;; 	      (require 'ob-emacs-lisp))))

;; (add-hook 'emacs-startup-hook 'my-org-setup)

(provide 'init-org)
;;; init-org.el ends here
