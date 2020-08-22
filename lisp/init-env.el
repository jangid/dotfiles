;;; init-env.el --- set environment -*-lexical-mode: t-*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package exec-path-from-shell
  :ensure t)
;;(eval-when-compile (require 'exec-path-from-shell))
(exec-path-from-shell-initialize)

(use-package direnv
  :ensure t)
(add-hook 'after-init-hook 'direnv-mode)

;; default email address and full name
(setq user-mail-address	"p4j@j4d.net"
      user-full-name "Pankaj Jangid")

;; time-zone
(eval-when-compile (require 'solar))

;; (setq calendar-latitude 28.6)		; New Delhi
;; (setq calendar-longitude 77.3)
;; (setq calendar-location-name "New Delhi, India")

(setq calendar-latitude 26.9)		; Jaipur
(setq calendar-longitude 77.8)
(setq calendar-location-name "Jaipur, India")

(setq calendar-time-zone +330)
(setq calendar-standard-time-zone-name "IST")
(setq calendar-daylight-time-zone-name "IST")

(provide 'init-env)
;;; init-env.el ends here
