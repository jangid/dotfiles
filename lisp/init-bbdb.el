;;; init-bbdb.el --- configure bbdb -*- lexical-binding: t -*-

;;; Commentary:
;; Get help for key bindings

;;; Code:

(require 'init-use-package)
(use-package bbdb
  :ensure t
  :config
  (declare-function bbdb-initialize "bbdb.el")
  (bbdb-initialize 'gnus 'message))

(provide 'init-bbdb)
;;; init-bbdb.el ends here
