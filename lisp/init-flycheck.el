;; init-flycheck.el --- configure flycheck -*- lexical-binding: t -*-

(when (package-installed-p '(flycheck))
  (add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'init-flycheck)
;; end-of init-flycheck.el
