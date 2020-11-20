;;; init-ebdb.el --- configure ebdb -*- lexical-binding: t -*-

;;; Commentary:
;; Get help for key bindings

;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package ebdb
  :ensure t
  :defer t
  :config
  (setq ebdb-mua-pop-up nil)
  (use-package ebdb-gnus)
  (use-package ebdb-message))

(provide 'init-ebdb)
;;; init-ebdb.el ends here
