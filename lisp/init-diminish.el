;;; init-diminish.el --- diminish config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package diminish
  :ensure t
  :config
  (diminish 'which-key-mode)
  (diminish 'company-mode)
  (diminish 'yas-minor-mode)
  (diminish 'hs-minor-mode)
  (diminish 'eldoc-mode)
  (diminish 'projectile-mode))

(provide 'init-diminish)
;;; init-diminish.el ends here
