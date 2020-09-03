;;; init-dart.el --- dart configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)
(require 'init-prog-common)

(use-package dart-mode
  :ensure t
  :config
  (require 'init-prog-common)
  (use-package company
    :ensure t
    :hook
    (dart-mode . company-mode))
  (use-package yasnippet
    :ensure t
    :hook
    (dart-mode . yas-minor-mode))
  (use-package eglot
    :ensure t
    :config
    (add-to-list 'eglot-server-programs
	         '(dart-mode . ("dart"
			        "/Users/pankaj/work/tools/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot"
			        "--lsp")))
    :hook
    (dart-mode . eglot-ensure)))

(provide 'init-dart)
;;; init-dart.el ends here
