;;; init-bbdb.el --- configure bbdb -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

;; bbdb
(eval-when-compile (require 'bbdb))
(bbdb-initialize 'gnus 'message)
(bbdb-mua-auto-update-init 'gnus 'message)
(setq bbdb-mua-pop-up nil)
(setq bbdb-mua-update-interactive-p '(query . create))
(setq bbdb-message-all-addresses t)
;; (setq bbdb-north-american-phone-numbers-p nil)
;; (setq bbdb-user-mail-names
;;       (regexp-opt '("p4j@j4d.net"
;; 		    "pankaj.jangid@gmail.com"
;; 		    "pankaj.jangid@optimizory.com")))

(eval-when-compile (require 'gnus-sum))
;; use ; on a message to invoke bbdb interactively
(add-hook
 'gnus-summary-mode-hook
 (lambda ()
   (define-key gnus-summary-mode-map (kbd ";") 'bbdb-mua-edit-field)))

(provide 'init-bbdb)
;;; init-bbdb.el ends here