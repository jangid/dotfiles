;;; init-which-key.el --- configure which-key -*- lexical-binding: t -*-

;;; Commentary:
;; Get help for key bindings

;;; Code:

(require 'init-use-package)

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(provide 'init-which-key)
;;; init-which-key.el ends here
