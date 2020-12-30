;;; init-prog.el --- defaults for prog mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'prog-mode-hook #'abbrev-mode)

(provide 'init-prog)
;;; init-prog.el ends here
