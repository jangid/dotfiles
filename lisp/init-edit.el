;;; init-edit.el --- editing helpers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
;; (setq mac-right-option-modifier nil)
;; (setq mac-right-command-modifier nil)

(add-hook 'after-init-hook 'show-paren-mode)
(add-hook 'after-init-hook #'which-key-mode)

(provide 'init-edit)
;;; init-edit.el ends here
