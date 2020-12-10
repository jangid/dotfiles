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
  (defun my-org-mode-hook ()
    (declare-function org-indent-mode "org.el")
    (org-indent-mode +1))
  (add-hook 'org-mode-hook 'my-org-mode-hook)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (R . t)
     (python . t)
     (C . t)
     (java . t)
     (js . t)
     (css . t)
     (sql . t)
     (plantuml . t)))
  :init
  (defvar org-agenda-include-diary t)
  (defvar org-plantuml-jar-path "/usr/local/opt/libexec/plantuml.jar")
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
		"CANCELLED(c)")))
  (defvar org-agenda-custom-commands
    '(("o" "At Optimzory" tags-todo "@optimizory"
       ((org-agenda-overriding-header "Optimizory:")
        (org-agenda-skip-function
         #'my-org-agenda-skip-all-siblings-but-first)))
      ("j" "At J4D" tags-todo "@j4d"
       ((org-agenda-overriding-header "J4D:")
        (org-agenda-skip-function
         #'my-org-agenda-skip-all-siblings-but-first)))
      ("h" "At Home" tags-todo "@home"
       ((org-agenda-overriding-header "Home and Personal:")
        (org-agenda-skip-function
         #'my-org-agenda-skip-all-siblings-but-first)))
      ("f" "At FSF" tags-todo "@fsf"
       ((org-agenda-overriding-header "FSF:")
        (org-agenda-skip-function
         #'my-org-agenda-skip-all-siblings-but-first)))
      ("n" "Agenda and all TODOs"
       ((agenda "")
	(alltodo ""))))))

(defun my-org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (declare-function org-goto-sibling "org.el")
  (declare-function org-get-todo-state "org.el")
  (declare-function outline-next-heading "outline.el")

  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))
		  
(defun org-current-is-todo ()
  "Check if the currect node is in todo state."
  (string= "TODO" (org-get-todo-state)))

(provide 'init-org)
;;; init-org.el ends here
