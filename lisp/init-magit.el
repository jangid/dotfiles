;;; init-magit.el --- magit configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package magit
  :ensure t
  :bind
  ("C-x g" . magit-status)
  ("C-x M-g" . magit-dispatch-popup))

(provide 'init-magit)
;;; init-magit.el ends here
