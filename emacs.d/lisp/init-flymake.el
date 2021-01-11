;;; init-flymake.el --- flymake configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'flymake-mode-hook
	  (lambda ()
	    (local-set-key (kbd "M-n") 'flymake-goto-next-error)
	    (local-set-key (kbd "M-p") 'flymake-goto-prev-error)))

(provide 'init-flymake)
;;; init-flymake.el ends here
