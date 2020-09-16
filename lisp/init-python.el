;;; init-python.el --- python configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

(use-package python
  :ensure t
  :config
  (require 'init-prog-common)
  (setq python-indent-guess-indent-offset-verbose nil)
    :config
  (require 'init-prog-common)
  (use-package yasnippet
    :ensure t
    :hook
    (python-mode . yas-minor-mode))
  (use-package eglot
    :ensure t
    :hook
    (python-mode . eglot-ensure)))

(provide 'init-python)
;;; init-python.el ends here
