;;; init-java.el --- java configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :ensure t)
(use-package lsp-java
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package dap-mode
  :ensure t)

(defun my/java-mode-hook ()
  "Custom code to run on start of 'java-mode'."
  (setq lsp-java-server-install-dir
	(expand-file-name "~/work/code/eclipse.jdt.ls"))
  (setq lsp-java-workspace-dir
	(expand-file-name "~/work/code/eclipse"))
  (setq lsp-java-workspace-cache-dir
	(expand-file-name "~/work/code/eclipse/.cache/")))

(add-hook 'java-mode-hook #'my/java-mode-hook)
(add-hook 'java-mode-hook #'flycheck-mode)
(add-hook 'java-mode-hook #'dap-mode)
(add-hook 'java-mode-hook #'lsp)

(provide 'init-java)
;;; init-java.el ends here
