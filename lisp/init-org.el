;;; init-org.el --- configure org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Global key bindings
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-switchb)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c f") 'org-footnote-action)

(defun my/org-mode-hook ()
  "Custom code to run on start of 'org-mode'."
  (visual-line-mode)

  (declare-function org-superstar-mode "org-superstar.el")
  (org-superstar-mode)
  (declare-function org-indent-mode "org-indent.el")
  (org-indent-mode)

  (require 'org-tempo)

  (require 'ob-python)
  (require 'ob-C)
  (require 'ob-java)
  (require 'ob-latex)
  (require 'ob-js)
  (require 'ob-css)
  (require 'ob-sed)
  (require 'ob-awk)
  (require 'ob-perl)
  (require 'ob-sql)
  (require 'ob-emacs-lisp))

(add-hook 'org-mode-hook 'my/org-mode-hook)


(provide 'init-org)
;;; init-org.el ends here
