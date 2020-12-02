;;; init-ebdb.el --- configure ebdb -*- lexical-binding: t -*-

;;; Commentary:
;; Get help for key bindings

;;; Code:

(eval-when-compile (require 'init-use-package))
;; (use-package ebdb
;;   :ensure t
;;   :config
;;   (use-package ebdb-gnus  ; no `:ensure t' here, installed with ebdb
;;     :hook emacs-startup)
;;   (use-package ebdb-message
;;     :hook emacs-startup))

;; (use-package ebdb
;;   :ensure t
;;   :config
;;   (require 'edbd-gnus)
;;   (require 'ebdb-message))

;; (use-package 'ebdb-gnus  ; no `:ensure t' here, installed with ebdb
;;   :hook emacs-startup)
;; (use-package 'ebdb-message
;;   :hook emacs-startup)

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (progn
	      (defvar ebdb-mua-pop-up nil)
	      (require 'ebdb-gnus)
	      (require 'ebdb-message))))

;; Error (use-package): Failed to parse package 'ebdb-gnus: Wrong type argument: symbolp, 'ebdb-gnus Disable showing Disable logging

(provide 'init-ebdb)
;;; init-ebdb.el ends here
