;;; init-prog.el --- programmer's configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package company
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package yasnippet
  :ensure t)

(add-hook 'prog-mode-hook #'company-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'prog-mode-hook #'electric-pair-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)
;;(add-hook 'prog-mode-hook #'flyspell-prog-mode)
(add-hook 'prog-mode-hook #'semantic-mode)

(provide 'init-prog)
;;; init-prog.el ends here
