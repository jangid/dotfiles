;;; init-which-key.el --- configure which-key -*- lexical-binding: t -*-

;;; Commentary:
;; Get help for key bindings


;;; Code:

(require 'package)
(defun my/which-key-setup ()
  "Startup configuration for which-key."
  ;; (unless (package-installed-p 'which-key)
  ;;   (package-install 'which-key))

  (add-to-list 'load-path (expand-file-name
			   "emacs-which-key/which-key.el"
			   user-emacs-directory))
  (require 'which-key)
  (which-key-mode)
  ;; (require 'which-key)
  ;; (declare-function which-key-setup-side-window-right-bottom "which-key")
  ;; (which-key-setup-side-window-right-bottom)
  (declare-function which-key-mode "which-key")
  (which-key-mode 1))

(my/which-key-setup)

(provide 'init-which-key)
;;; init-which-key.el ends here
