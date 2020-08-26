;;; early-init.el --- before init.el
;;; Commentary:
;;; Code:

;; window size
;; (setq default-frame-alist
;;       '((height . 54)
;; 	(width . 180)))

(require 'package)

;; MELPA stable repositlry
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))

(provide 'early-init)
;;; early-init.el ends here
