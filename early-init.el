;;; early-init.el --- before init.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

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
