;;; init-date-time.el --- date, time, calendar config -*-lexical-mode: t-*-
;;; Commentary:

;; 1 minute is equal to 60 seconds.  1 degree is equal to 1 hour, that
;; is equal to 60 minutes or 3600 seconds.  To calculate decimal
;; degrees, we use the DMS to decimal degree formula below:
;;
;; Decimal Degrees = degrees + (minutes/60) + (seconds/3600)

;;; Code:

;; time-zone
;;(eval-when-compile (require 'solar))


(custom-set-variables
 ;; '(calendar-latitude 28.6)		; New Delhi
 ;; '(calendar-longitude 77.3)
 ;; '(calendar-location-name "New Delhi, India")
 ;; '(calendar-latitude 26.9)		; Jaipur
 ;; '(calendar-longitude 75.8)
 '(calendar-latitude [26 52 north])	; Jaipur
 '(calendar-longitude [75 46 east])
 '(calendar-location-name "Jaipur, India")
 '(calendar-time-zone +330))
 ;; '(calendar-time-zone-style 'numeric))
 ;; '(calendar-standard-time-zone-name "IST")
 ;; '(calendar-daylight-time-zone-name "IST"))

(provide 'init-date-time)
;;; init-date-time.el ends here
