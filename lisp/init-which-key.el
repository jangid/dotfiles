;;; init-which-key.el --- configure which-key -*- lexical-binding: t -*-

;;; Commentary:
;; Get help for key bindings

;;; Code:

(require 'package)
(defun my/which-key-setup ()
  "Startup configuration for which-key."
  (unless (package-installed-p 'which-key)
    (package-install 'which-key))

  (which-key-mode 1))

(my/which-key-setup)

(provide 'init-which-key)
;;; init-which-key.el ends here
