;;; init-flycheck.el --- configure flycheck -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'flycheck)

(when (package-installed-p 'flycheck)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
