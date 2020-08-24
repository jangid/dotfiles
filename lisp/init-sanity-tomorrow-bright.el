;;; init-sanity-tomorrow-bright.el --- theme -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package color-theme-sanityinc-tomorrow
  :ensure t)

(add-hook 'after-init-hook
	  (lambda () (load-theme 'sanityinc-tomorrow-bright t nil)))

;; TODO - disable all previously enabled themes

(provide 'init-sanity-tomorrow-bright)
;; init-sanity-tomorrow-bright.el ends here
