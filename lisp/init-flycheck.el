;; init-flycheck.el --- configure flycheck -*- lexical-binding: t -*-

(if (package-installed-p '(flycheck))
    (add-hook 'after-init-hook #'global-flycheck-mode)
  (message "flycheck loaded"))

(provide 'init-flycheck)
;; end-of init-flycheck.el
