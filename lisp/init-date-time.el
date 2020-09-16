;;; init-date-time.el --- date, time, calendar config -*-lexical-mode: t-*-
;;; Commentary:
;;; Code:

;; time-zone
;; (eval-when-compile (require 'solar))
(require 'solar)

;; (setq calendar-latitude 28.6)		; New Delhi
;; (setq calendar-longitude 77.3)
;; (setq calendar-location-name "New Delhi, India")

(setq calendar-latitude 26.9)		; Jaipur
(setq calendar-longitude 77.8)
(setq calendar-location-name "Jaipur, India")

(setq calendar-time-zone +330)
(setq calendar-standard-time-zone-name "IST")
(setq calendar-daylight-time-zone-name "IST")

(provide 'init-date-time)
;;; init-date-time.el ends here
