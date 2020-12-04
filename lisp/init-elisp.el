;;; init-elisp.el --- elisp configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'emacs-lisp-mode-hook #'flymake-mode)
(add-hook 'emacs-lisp-mode-hook #'display-line-numbers-mode)
(add-hook 'emacs-lisp-mode-hook #'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook #'abbrev-mode)

(provide 'init-elisp)
;;; init-elisp.el ends here
