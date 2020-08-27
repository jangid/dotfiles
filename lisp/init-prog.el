;;; init-prog.el --- programmer's configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)

;; (use-package company
;;   :ensure t
;;   :hook
;;   (prog-mode . company-mode))

(use-package yasnippet
  :ensure t
  :hook
  (prog-mode . yas-minor-mode))

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'electric-pair-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'prog-mode-hook #'semantic-mode)
(add-hook 'prog-mode-hook #'abbrev-mode)

(provide 'init-prog)
;;; init-prog.el ends here
