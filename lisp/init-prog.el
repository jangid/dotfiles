;;; init-prog.el --- programmer's configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (when (< emacs-major-version 27)
;;   (eval-and-compile
;;     (package-initialize)))

(eval-when-compile (require 'company))
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
  "Company package isn't loaded during init; hence the lazy function."
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)
(eval-when-compile (require 'flymake-python-pyflakes))
(add-hook 'python-mode-hook #'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")
;; (add-hook 'python-mode-hook 'yapf-mode)
;; (elpy-enable)

;; rust-lang
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook #'eglot-ensure)

;; JavaScript
(eval-when-compile (require 'js))
;; (add-hook 'js-mode-hook #'eglot-ensure)
(add-hook 'js-mode-hook #'flymake-mode)
(setq js-indent-level 2)
;; npm install -g tern
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
;; npm install -g eslint
(add-hook 'js-mode-hook (lambda () (flymake-eslint-enable)))
(defun my/js-mode-hook ()
  "Company package isn't loaded during init; hence the lazy function."
  (add-to-list 'company-backends 'company-tern))
(add-hook 'js-mode-hook 'my/js-mode-hook)
(add-hook 'js-mode-hook #'abbrev-mode)

(provide 'init-prog)
;;; init-prog.el ends here
