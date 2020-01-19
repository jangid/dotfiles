;;; init-prog.el --- programmer's configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Common settings
(add-hook 'prog-mode-hook #'company-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'prog-mode-hook #'electric-pair-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)
;;(add-hook 'prog-mode-hook #'flyspell-prog-mode)
(add-hook 'prog-mode-hook #'semantic-mode)

(require 'flymake)
(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)

;; company settings
;;(require 'company)
;;(require 'company-lsp)
;;(push 'company-lsp company-backends)

;; Emacs Lisp
(add-hook 'emacs-lisp-mode-hook #'flymake-mode)

;; Java
;; (require 'init-java)
;;(load-library "lsp-java") 		; TODO: This library is not
					; automatically loaded. Need
					; to check why.

;;(setq lsp-java-workspace-dir (expand-file-name "~/work/code/eclipse"))
;; I have downloaded and compiled Eclipse JDT myself. But actually
;; lsp-java can do it on its own. You don't need to do it manually.
;;(setq lsp-java-server-install-dir (expand-file-name "~/work/code/github/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/"))

;;(add-hook 'java-mode-hook #'eglot-ensure)

;; Python
;; (add-hook 'python-mode-hook #'eglot-ensure)
(add-hook 'python-mode-hook #'flymake-mode)
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook #'company-mode)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")
;; (add-hook 'python-mode-hook 'yapf-mode)
;; (elpy-enable)

;; rust-lang
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook #'eglot-ensure)

;; JavaScript
;; (add-hook 'js-mode-hook #'eglot-ensure)
(setq js-indent-level 2)

;; Lua - disable; not working with emacs27
;;(require 'company) ;; despite package-initialize this is required. Not sure why.
;;(require 'company-lua)
;;(add-hook 'lua-mode-hook #'flymake-lua-load)
;;(push 'company-lua company-backends)

(provide 'init-prog)
;;; init-prog.el ends here
