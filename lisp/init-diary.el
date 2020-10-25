;;; init-diary.el --- diary config -*-lexical-mode: t-*-

;;; Commentary:

;;; Code:

(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
(add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)

(defun my/ical-add ()
  "Add .ics attachment to ical-diary file."
  (interactive)
  (icalendar-import-buffer "ical-diary" nil nil))

(provide 'init-diary)
;;; init-diary.el ends here
