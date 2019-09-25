;;; init-java.el --- java specific configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'lsp)
(require 'lsp-java)

;;(load-library "lsp-java") 		; TODO: This library is not
					; automatically loaded. Need
					; to check why.

(setq lsp-java-workspace-dir (expand-file-name "~/work/code/eclipse"))
;; I have downloaded and compiled Eclipse JDT myself. But actually
;; lsp-java can do it on its own. You don't need to do it manually.
(setq lsp-java-server-install-dir
      (expand-file-name "~/work/code/github/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/"))

(add-hook 'java-mode-hook #'lsp)

(provide 'init-java)
;;; init-java.el ends here
