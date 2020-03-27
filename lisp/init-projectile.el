;;; init-projectile --- configure projectile -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

;; projectile
(eval-when-compile (require 'projectile))
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
;; (setq projectile-project-search-path '("~/work/code/"))
;; (setq projectile-mode-line '(:eval (format " P[%s]" (projectile-project-name))))
;; (setq projectile-mode-line-lighter " P")

(provide 'init-projectile)
;;; init-projectile.el ends here
