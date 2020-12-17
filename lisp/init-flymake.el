;;; init-flymake.el --- flymake configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (global-set-key (kbd "M-n") 'flymake-goto-next-error)
	    (global-set-key (kbd "M-p") 'flymake-goto-prev-error)))

(provide 'init-flymake)
;;; init-flymake.el ends here
