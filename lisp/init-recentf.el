;;; init-recentf.el --- configure recentf -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (recentf-mode 1)))

(provide 'init-recentf)
;;; init-recentf.el ends here
