;;; init-keys.el --- customize keyboard behaviour -*- lexical-binding: t -*-

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq mac-right-option-modifier 'super)

(add-hook 'after-init-hook #'which-key-mode)

(provide 'init-keys)
;;; end-of init-keys.el
