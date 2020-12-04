;;; init-prog.el --- defaults for prog mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun my-prog-mode ()
  "Enable defaults for prog-mode."
  (interactive)

  (add-hook 'prog-mode-hook #'display-line-numbers-mode)
  (add-hook 'prog-mode-hook #'electric-pair-local-mode)
  (add-hook 'prog-mode-hook #'hs-minor-mode)
  (add-hook 'prog-mode-hook #'abbrev-mode))

(add-hook 'emacs-startup-hook 'my-prog-mode)

(provide 'init-prog)
;;; init-prog.el ends here
