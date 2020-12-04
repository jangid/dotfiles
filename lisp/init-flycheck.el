;;; init-flycheck.el --- flycheck configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package flycheck
  :ensure t
  :hook ((kotlin-mode . flycheck-mode)
	 (plantuml-mode . flycheck-mode)))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
