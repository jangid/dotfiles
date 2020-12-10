;;; init-ebdb.el --- configure ebdb -*- lexical-binding: t -*-

;;; Commentary:
;; Get help for key bindings

;;; Code:

(setq compose-mail-user-agent-warnings nil)

(eval-when-compile (require 'init-use-package))
(use-package ebdb
  :ensure t
  :init
  (defvar ebdb-mua-pop-up nil)
  :hook
  (emacs-startup . (lambda ()
		     (use-package ebdb-gnus)
		     (use-package ebdb-message))))

(provide 'init-ebdb)
;;; init-ebdb.el ends here
