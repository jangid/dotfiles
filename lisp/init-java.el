;;; init-java.el --- java configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package lsp-mode
  :ensure t
  :hook
  (java-mode . lsp))

(use-package lsp-java
  :ensure t)

(use-package flycheck
  :ensure t
  :hook
  (java-mode . flycheck-mode))

(use-package dap-mode
  :ensure t
  :hook
  (java-mode . dap-mode))

;; (defun my/java-mode-hook ()
;;   "Custom code to run on start of 'java-mode'."
;;   (setq lsp-java-server-install-dir
;; 	(expand-file-name "~/work/code/eclipse.jdt.ls"))
;;   (setq lsp-java-workspace-dir
;; 	(expand-file-name "~/work/code/eclipse"))
;;   (setq lsp-java-workspace-cache-dir
;; 	(expand-file-name "~/work/code/eclipse/.cache/")))

;; (add-hook 'java-mode-hook #'my/java-mode-hook)


(provide 'init-java)
;;; init-java.el ends here
