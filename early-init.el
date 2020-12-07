;;; early-init.el --- before init.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; window size
;; (setq default-frame-alist
;;       '((height . 47)
;;  	(width . 169)
;; 	(left . 110)))
;; (setq default-frame-alist
;;       '((left . 175)
;; 	(top . 175)
;; 	(height . 36)
;; 	(width . 163)))
;; (setq default-frame-alist
;;       '((left . 175)))
;; (setq default-frame-alist
;;      '((left . 350)
;;	(top . 175)))

(setq default-frame-alist
       '((vertical-scroll-bars . nil)
	 (horizontal-scroll-bars . nil)
	 (tool-bar-lines . 0)))

(setq initial-frame-alist
       '((height . 56)
  	 (width . 174)
	 (left . 613)
	 (top . 391)))

(provide 'early-init)
;;; early-init.el ends here
