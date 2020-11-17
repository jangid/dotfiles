;;; init-ruby.el --- ruby configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package ruby-mode
  :hook
  ((ruby-mode . flymake-mode)
   (ruby-mode . display-line-numbers-mode)
   (ruby-mode . hs-minor-mode)
   (ruby-mode . abbrev-mode)))

(provide 'init-ruby)
;;; init-ruby.el ends here
