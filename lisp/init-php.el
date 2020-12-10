;;; init-php.el --- php configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package php-mode
  :ensure t
  :mode "\\.php\\'"
  :interpreter "/usr/local/bin/php"
  :config
  (add-hook 'php-mode-hook #'display-line-numbers-mode)
  (add-hook 'php-mode-hook #'electric-pair-local-mode)
  (add-hook 'php-mode-hook #'hs-minor-mode)
  (add-hook 'php-mode-hook #'abbrev-mode))

(provide 'init-php)
;;; init-php.el ends here
