;;; init-twitter.el --- tweet from emacs
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package twittering-mode
  :ensure t
  :init
  (defalias 'epa--decode-coding-string 'decode-coding-string)
  :config
  (setq twittering-use-master-password t))

;; (use-package nntwitter
;;   :ensure t)

(provide 'init-twitter)
;;; init-twitter.el ends here
