;;; init-desktop.el --- configure desktop -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

;; desktop save restore
(eval-when-compile (require 'desktop))
(add-to-list 'desktop-path (expand-file-name "desktop" user-emacs-directory))
(desktop-save-mode +1)

(provide 'init-desktop)
;;; init-desktop.el ends here
