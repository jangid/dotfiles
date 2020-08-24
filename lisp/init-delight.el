;;; init-delight.el --- delight config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package delight
  :ensure t)

(delight '((which-key-mode nil "which-key")
	   (company-mode nil "company")
	   (yas-minor-mode nil "yasnippet")
	   (hs-minor-mode nil "hideshow")
	   (eldoc-mode nil "eldoc")
	   (projectile-mode nil  "projectile")))

(provide 'init-delight)
;;; init-delight.el ends here
