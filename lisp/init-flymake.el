;;; init-flymake.el --- flymake configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package flymake
     :ensure t
     :bind
     ("M-n" . flymake-goto-next-error)
     ("M-p" . flymake-goto-prev-error))

(provide 'init-flymake)
;;; init-flymake.el ends here
