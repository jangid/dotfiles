;;; init-modeline.el --- modeline conf -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package all-the-icons)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; (display-time-mode +1)

(provide 'init-modeline)
;;; init-modeline.el ends here
