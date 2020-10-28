;;; init-twitter.el --- tweet from emacs
;;; Commentary:
;;; Code:

(require 'init-use-package)
(use-package twittering-mode
  :ensure t
  :config
  (setq twittering-use-master-password t))

(provide 'init-twitter)
;;; init-twitter.el ends here
