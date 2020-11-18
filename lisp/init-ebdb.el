;;; init-ebdb.el --- configure ebdb -*- lexical-binding: t -*-

;;; Commentary:
;; Get help for key bindings

;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package ebdb
  :ensure t
  :config
  (require 'ebdb-gnus)
  (require 'ebdb-message))

(provide 'init-ebdb)
;;; init-ebdb.el ends here
