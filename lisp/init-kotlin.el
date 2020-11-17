;;; init-kotlin.el --- kotlin configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package kotlin-mode
  :ensure t
  :mode
  (("\\.kt\\'" . kotlin-mode)
   ("\\.kts\\'" . kotlin-mode))
  :config
  (add-hook 'kotlin-mode-hook #'display-line-numbers-mode)
  (add-hook 'kotlin-mode-hook #'show-paren-mode)
  (add-hook 'kotlin-mode-hook #'hs-minor-mode)
  (add-hook 'kotlin-mode-hook #'abbrev-mode))

(use-package gradle-mode
  :ensure t)

(use-package flycheck-kotlin
  :ensure t
  :config
  (declare-function flycheck-mode "flycheck.el")
  (add-hook 'kotlin-mode-hook #'flycheck-mode))

(provide 'init-kotlin)
;;; init-kotlin.el ends here
