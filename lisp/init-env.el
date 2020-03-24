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

;; time-zone
(eval-when-compile (require 'solar))
(setq calendar-latitude 28.6)		; New Delhi
(setq calendar-longitude 77.3)
(setq calendar-location-name "New Delhi, India")
(setq calendar-time-zone +330)
(setq calendar-standard-time-zone-name "IST")
(setq calendar-daylight-time-zone-name "IST")

(provide 'init-env)
;;; init-env.el ends here
