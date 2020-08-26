;;; init-which-key.el --- configure which-key -*- lexical-binding: t -*-

;;; Commentary:
;; Get help for key bindings

;;; Code:

(require 'init-pkg)

(use-package which-key
  :ensure t)

(add-hook 'after-init-hook #'which-key-mode)

(provide 'init-which-key)
;;; init-which-key.el ends here
