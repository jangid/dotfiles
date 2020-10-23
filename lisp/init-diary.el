;;; init-diary.el --- diary config -*-lexical-mode: t-*-

;;; Commentary:

;;; Code:

;; option-1
;;(declare-function calendar-set-date-style "calendar.el")
;;(calendar-set-date-style 'european)

;; option-2
;; (custom-set-variables
;;  '(calendar-date-style 'european))

;; option-3
(defvar calendar-date-style)
(setq calendar-date-style 'european)

;; option-4
;; (eval-when-compile (require 'calendar))
;; (setq calendar-date-style 'european)

(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
(add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)

(defun my/ical-add ()
  "Add .ics attachment to ical-diary file."
  (interactive)
  (icalendar-import-buffer "ical-diary" nil nil))

(provide 'init-diary)
;;; init-diary.el ends here
