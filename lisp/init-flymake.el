;;; init-flymake.el --- flymake configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package flymake
  :ensure t)

(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)

(provide 'init-flymake)
;;; init-flymake.el ends here
