;;; init-env.el --- set environment -*-lexical-mode: t-*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(eval-when-compile (require 'exec-path-from-shell))
(exec-path-from-shell-initialize)
(add-hook 'after-init-hook 'direnv-mode)

;; default email address and full name
(setq user-mail-address	"p4j@j4d.net"
      user-full-name "Pankaj Jangid")

(provide 'init-env)
;;; init-env.el ends here
