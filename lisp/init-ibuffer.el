;;; init-ibuffer.el --- configure ibuffer -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

;; default to Ibuffer
;; (global-set-key (kbd "C-x C-b") #'ibuffer-other-window)
(global-set-key (kbd "C-x C-b") #'ibuffer)

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
