(custom-set-variables
 ;; custom-set-variables was added by user.

 ;; SECTION: calendar, date, time
 
 ;; 1 minute is equal to 60 seconds.  1 degree is equal to 1 hour, that
 ;; is equal to 60 minutes or 3600 seconds.  To calculate decimal
 ;; degrees, we use the DMS to decimal degree formula below:
 ;;
 ;; Decimal Degrees = degrees + (minutes/60) + (seconds/3600)

 ;; '(calendar-latitude 28.6)		; New Delhi
 ;; '(calendar-longitude 77.3)
 ;; '(calendar-location-name "New Delhi, India")
 ;; '(calendar-latitude 26.9)		; Jaipur
 ;; '(calendar-longitude 75.8)
 '(calendar-latitude [26 52 north])
 '(calendar-location-name "Jaipur, India")
 '(calendar-longitude [75 46 east])
 '(calendar-time-zone 330)
 ;; '(calendar-time-zone-style 'numeric))
 ;; '(calendar-standard-time-zone-name "IST")
 ;; '(calendar-daylight-time-zone-name "IST"))

 ;; SECTION: version control
 '(add-log-dont-create-changelog-file t)
 ;; SECTION: packages
  '(package-selected-packages
    '(twittering-mode rust-mode php-mode org-mime markdown-mode kotlin-mode gradle-mode gnuplot-mode gnuplot flycheck plantuml-mode flycheck-plantuml flycheck-kotlin exec-path-from-shell eglot ebdb dockerfile-mode docker-compose-mode direnv diminish company)))

(custom-set-faces
 ;; custom-set-faces was added by user.
 )

(provide 'my-init)
;;; my-init.el ends here
