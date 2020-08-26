;;; init-dart.el --- dart configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs
	       '(dart-mode . ("dart"
			      "/usr/local/Cellar/dart/2.8.4/libexec/bin/snapshots/analysis_server.dart.snapshot"
			      "--lsp")))
  :hook
  (dart-mode . eglot-ensure))

(provide 'init-dart)
;;; init-dart.el ends here
