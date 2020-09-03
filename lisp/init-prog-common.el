;;; init-prog-common.el --- programmer's configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-flymake)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'electric-pair-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'prog-mode-hook #'semantic-mode)
(add-hook 'prog-mode-hook #'abbrev-mode)

(provide 'init-prog-common)
;;; init-prog-common.el ends here
