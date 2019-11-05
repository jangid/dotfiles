;;; init-edit.el --- editing helpers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'after-init-hook 'show-paren-mode)
(require 'init-keys)
(require 'init-lsp)

(provide 'init-edit)
;; init-edit.el ends here
