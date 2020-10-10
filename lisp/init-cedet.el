;;; init-cedet.el --- CEDET configuration -*- lexical-binding: t -*-
;;; Commentary:

;; Enable/disable semantic mode and submodes for various programming
;; languages using these two variables:
;;
;;  -- semantic-new-buffer-setup-functions
;;  -- semantic-default-submodes

;;; Code:

(setq semantic-default-submodes
      '(global-semanticdb-minor-mode
	global-semantic-idle-scheduler-mode
	global-semantic-idle-summary-mode
	global-semantic-idle-completions-mode))

;;(semantic-mode +1)

(provide 'init-cedet)
;;; init-cedet.el ends here
