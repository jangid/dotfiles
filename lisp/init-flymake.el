;;; init-flymake.el --- flymake configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (require 'init-use-package)
;; (use-package flymake
;;   :bind
;;   (("M-n" . flymake-goto-next-error)
;;    ("M-p" . flymake-goto-prev-error)))

;; TODO - enable use-package if it is included in emacs. Right now,
;; inclusion of use-package above is taking .3s extra.

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (global-set-key (kbd "M-n") 'flymake-goto-next-error)
	    (global-set-key (kbd "M-p") 'flymake-goto-prev-error)))

(provide 'init-flymake)
;;; init-flymake.el ends here
