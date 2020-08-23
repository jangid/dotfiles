;;; init-prog.el --- programmer's configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package company
  :ensure t)
(use-package dap-mode
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package yasnippet
  :ensure t)

(add-hook 'prog-mode-hook #'company-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'prog-mode-hook #'electric-pair-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)
;;(add-hook 'prog-mode-hook #'flyspell-prog-mode)
(add-hook 'prog-mode-hook #'semantic-mode)


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
