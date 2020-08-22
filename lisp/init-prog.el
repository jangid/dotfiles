;;; init-prog.el --- programmer's configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package magit
  :ensure t)
(use-package eglot
  :ensure t)
(use-package company
  :ensure t)
(use-package dap-mode
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package tern
  :ensure t)
(use-package flymake-eslint
  :ensure t)
(use-package yasnippet
  :ensure t)
(use-package lsp-mode
  :ensure t)
(use-package lsp-java
  :ensure t)
(use-package rust-mode
  :ensure t)

;; (eval-when-compile (require 'eglot))
;; (eval-when-compile (require 'company))

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

;; Emacs Lisp
(add-hook 'emacs-lisp-mode-hook #'flymake-mode)

;; Java
;; (eval-when-compile (require 'lsp-java))
(setq lsp-java-server-install-dir
      (expand-file-name "~/work/code/eclipse.jdt.ls"))
(setq lsp-java-workspace-dir
      (expand-file-name "~/work/code/eclipse"))
(setq lsp-java-workspace-cache-dir
      (expand-file-name "~/work/code/eclipse/.cache/"))
;; (defun my/java-mode-hook ()
;;   "Company package isn't loaded during init; hence the lazy function."
;;   (eval-when-compile (require 'company-lsp))
;;   (push 'company-lsp company-backends))

(add-hook 'java-mode-hook #'flycheck-mode)
;; (add-hook 'java-mode-hook #'my/java-mode-hook)
(add-hook 'java-mode-hook #'dap-mode)
(add-hook 'java-mode-hook #'lsp)

;; (setenv "CLASSPATH" "~/work/code/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.700.v20200207-2156.jar")
;; (add-hook 'java-mode-hook #'eglot-ensure)

;; Python
(use-package flymake-python-pyflakes
  :ensure t)
;;(eval-when-compile (require 'flymake-python-pyflakes))

(defun my/python-mode-hook ()
  "Company package isn't loaded during init; hence the lazy function."
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook #'flymake-mode)
(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook #'abbrev-mode)
(add-hook 'python-mode-hook #'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")
;; (add-hook 'python-mode-hook 'yapf-mode)

;; rust-lang
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook #'eglot-ensure)

;; JavaScript
(eval-when-compile (require 'js))
(add-to-list 'auto-mode-alist '("\\.mjs\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.cjs\\'" . js-mode))

;; (add-hook 'js-mode-hook #'eglot-ensure)
(add-hook 'js-mode-hook #'flymake-mode)
(setq js-indent-level 2)
;; npm install -g tern
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
;; npm install -g eslint
(add-hook 'js-mode-hook (lambda () (flymake-eslint-enable)))
(defun my/js-mode-hook ()
  "Company package isn't loaded during init; hence the lazy function."
  (setq-default indent-tabs-mode nil)
  (add-to-list 'company-backends 'company-tern))
(add-hook 'js-mode-hook 'my/js-mode-hook)
(add-hook 'js-mode-hook #'abbrev-mode)

;; Dart
(add-to-list 'eglot-server-programs
	     '(dart-mode . ("dart"
			    "/usr/local/Cellar/dart/2.8.4/libexec/bin/snapshots/analysis_server.dart.snapshot"
			    "--lsp")))
(add-hook 'dart-mode-hook #'eglot-ensure)

;; Go
(add-hook 'go-mode-hook #'eglot-ensure)

;; Ruby
(add-hook 'ruby-mode-hook #'eglot-ensure)

(provide 'init-prog)
;;; init-prog.el ends here
