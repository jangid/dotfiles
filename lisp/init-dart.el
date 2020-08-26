;;; init-dart.el --- dart configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package eglot
  ensure: t)

(add-to-list 'eglot-server-programs
	     '(dart-mode . ("dart"
			    "/usr/local/Cellar/dart/2.8.4/libexec/bin/snapshots/analysis_server.dart.snapshot"
			    "--lsp")))

(add-hook 'dart-mode-hook #'eglot-ensure)

(provide 'init-dart)
;;; init-dart.el ends here
