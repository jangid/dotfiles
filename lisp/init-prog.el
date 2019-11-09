;;; init-prog.el --- programmer's configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'prog-mode-hook #'company-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'prog-mode-hook #'electric-pair-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'prog-mode-hook #'flyspell-prog-mode)

(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)

;; Emacs Lisp
(add-hook 'emacs-lisp-mode-hook #'flymake-mode)
;; Java
;; (require 'init-java)
;;(load-library "lsp-java") 		; TODO: This library is not
					; automatically loaded. Need
					; to check why.

(setq lsp-java-workspace-dir (expand-file-name "~/work/code/eclipse"))
;; I have downloaded and compiled Eclipse JDT myself. But actually
;; lsp-java can do it on its own. You don't need to do it manually.
(setq lsp-java-server-install-dir
      (expand-file-name "~/work/code/github/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/"))

(add-hook 'java-mode-hook #'lsp)

;; Python
(add-hook 'python-mode-hook #'lsp)

;; rust-lang
(require 'flymake-rust)
;;(setq flymake-rust-use-cargo nil)
(add-hook 'rust-mode-hook #'flymake-rust-load)
(add-hook 'rust-mode-hook #'lsp)

;; Lua - disable; not working with emacs27
;;(require 'company) ;; despite package-initialize this is required. Not sure why.
;;(require 'company-lua)
;;(add-hook 'lua-mode-hook #'flymake-lua-load)
;;(push 'company-lua company-backends)

(provide 'init-prog)
;;; init-prog.el ends here
