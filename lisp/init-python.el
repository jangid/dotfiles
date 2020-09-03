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
  (use-package company
    :ensure t
    :hook
    (python-mode . company-mode))
  ;; (use-package company
  ;;   :ensure t
  ;;   :config
  ;;   (use-package company-jedi
  ;;     :ensure t
  ;;     :config
  ;;     (add-to-list 'company-backends 'company-jedi))
  ;;   :hook
  ;;   (python-mode . company-mode))
  (use-package yasnippet
    :ensure t
    :hook
    (python-mode . yas-minor-mode))
  (use-package eglot
    :ensure t
    :hook
    (python-mode . eglot-ensure)))

  ;; (use-package flymake-python-pyflakes
  ;;   :ensure t
  ;;   :config
  ;;   (setq flymake-python-pyflakes-executable "flake8")
  ;;   :hook
  ;;   (python-mode . flymake-python-pyflakes-load)
  ;;   (python-mode . flymake-mode)))

(provide 'init-python)
;;; init-python.el ends here
