;;; init-keys.el --- customize keyboard behaviour -*- lexical-binding: t -*-

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq mac-right-option-modifier nil)
(setq mac-right-command-modifier nil)

(add-hook 'after-init-hook #'which-key-mode)

(provide 'init-keys)
;;; init-keys.el ends here
