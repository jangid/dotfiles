;;; init-editorconfig.el --- configure editors -*- lexical-binding: t -*-

;;; Commentary:
;; Maintain consistent coding style

;;; Code:

(require 'package)
(defun my/editorconfig-setup ()
  "Startup configuration for editorconfig."
  (unless (package-installed-p 'editorconfig)
    (package-install 'editorconfig))

  (editorconfig-mode 1))

(my/editorconfig-setup)

(provide 'init-editorconfig)
;;; init-editorconfig.el ends here
