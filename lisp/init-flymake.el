;;; init-flymake.el --- flymake configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'flymake)

(add-hook 'prog-mode-hook #'flymake-mode)
(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)

(provide 'init-flymake)
;;; init-flymake.el ends here
