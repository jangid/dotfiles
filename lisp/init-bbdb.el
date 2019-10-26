;;; init-bbdb.el --- contacts db

;; (require 'bbdb-autoloads)
(require 'bbdb)

;; initialization
(bbdb-initialize 'gnus 'message)
(bbdb-mua-auto-update-init 'gnus 'message)

;; size of the bbdb popup
;; (setq bbdb-pop-up-window-size 0.15)
;; (setq bbdb-mua-pop-up-window-size 0.15)
;;No popup-buffers
(setq bbdb-mua-pop-up nil)

;; What do we do when invoking bbdb interactively
(setq bbdb-mua-update-interactive-p '(query . create))

;; Make sure we look at every address in a message and not only the
;; first one
(setq bbdb-message-all-addresses t)

;; use ; on a message to invoke bbdb interactively
(add-hook
 'gnus-summary-mode-hook
 (lambda ()
    (define-key gnus-summary-mode-map (kbd ";") 'bbdb-mua-edit-field)))(require 'bbdb)

;;If you don't live in Northern America, you should disable the
;;syntax check for telephone numbers by saying
(setq bbdb-north-american-phone-numbers-p nil)

;;Tell bbdb about your email address:
(setq bbdb-user-mail-names
      (regexp-opt '("pankaj.jangid@gmail.com"
		    "pankaj.jangid@optimizory.com")))

;;cycling while completing email addresses
;; (setq bbdb-complete-name-allow-cycling t)

(provide 'init-bbdb)
;;; init-bbdb.el ends here
