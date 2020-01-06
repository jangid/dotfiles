;;; early-init.el --- before init.el
;;; Commentary:
;;; Code:

;; Produce backtrace on error
(setq debug-on-error t)

;; Directory to hold modular lisp files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; window size
;; (setq default-frame-alist
;;       '((height . 54)
;; 	(width . 180)))

(provide 'early-init)
;;; early-init.el ends here
