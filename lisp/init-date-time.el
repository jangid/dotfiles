;;; init-date-time.el --- date, time, calendar config -*-lexical-mode: t-*-
;;; Commentary:

;; 1 minute is equal to 60 seconds.  1 degree is equal to 1 hour, that
;; is equal to 60 minutes or 3600 seconds.  To calculate decimal
;; degrees, we use the DMS to decimal degree formula below:
;;
;; Decimal Degrees = degrees + (minutes/60) + (seconds/3600)

;;; Code:

;; time-zone
;; (eval-when-compile (require 'solar))
(require 'solar)

;; (setq calendar-latitude 28.6)		; New Delhi
;; (setq calendar-longitude 77.3)
;; (setq calendar-location-name "New Delhi, India")

;; (setq calendar-latitude 26.9)		; Jaipur
;; (setq calendar-longitude 75.8)
(setq calendar-latitude [26 52 north])		; Jaipur
(setq calendar-longitude [75 46 east])
(setq calendar-location-name "Jaipur, India")

(setq calendar-time-zone +330)
(setq calendar-standard-time-zone-name "IST")
(setq calendar-daylight-time-zone-name "IST")

(provide 'init-date-time)
;;; init-date-time.el ends here
