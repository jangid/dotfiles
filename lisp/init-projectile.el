;;; init-projectile --- configure projectile -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

;; projectile
(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode 1))

(provide 'init-projectile)
;;; init-projectile.el ends here
