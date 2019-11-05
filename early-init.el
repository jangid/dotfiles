;;; early-init.el --- before init.el
;;; Commentary:
;;; Code:

;; Produce backtrace on error
(setq debug-on-error t)

;; Directory to hold modular lisp files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(provide 'early-init)
;;; early-init.el ends here
