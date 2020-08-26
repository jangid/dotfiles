;;; init-theme.el --- theme settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (add-hook 'after-init-hook
	    (lambda () (load-theme 'sanityinc-tomorrow-bright t nil))))

;; TODO - disable all previously enabled themes

(provide 'init-theme)
;;; init-theme.el ends here
