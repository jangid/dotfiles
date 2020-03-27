;;; init-dired.el --- configure dired-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; use emacs' emulation of ls command; mac doesn't have ls with --dired
(eval-when-compile (require 'dired))
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

(provide 'init-dired)
;;; init-dired.el ends here
