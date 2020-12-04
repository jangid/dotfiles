;;; init-plantuml.el --- configure plantuml -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package plantuml-mode
  :ensure t
  :config
  (use-package flycheck-plantuml
    :ensure t))

(provide 'init-plantuml)
;;; init-plantuml.el ends here
