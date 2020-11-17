;;; init-python.el --- python configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package python
  :config
  (if (and (eq system-type 'darwin) (executable-find "ipython"))
      (custom-set-variables
       '(python-shell-interpreter "ipython"))
    (custom-set-variables
     '(python-shell-interpreter "python3")))
  :hook
  ((python-mode . flymake-mode)
   (python-mode . display-line-numbers-mode)
   (python-mode . hs-minor-mode)
   (python-mode . abbrev-mode)))

(provide 'init-python)
;;; init-python.el ends here
