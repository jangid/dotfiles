;;; init-js.el --- javascript conf -*- lexical-binding: t -*-

;;; Commentary:

;; Install follwoing npm packages for this configuration to work
;; npm install -g eslint

;;; Code:

(add-to-list 'auto-mode-alist
	     `(,(regexp-opt '(".mjs" ".cjs")) . js-mode))

(setq indent-tabs-mode nil)
(defvar js-indent-level)
(setq js-indent-level 2)

(provide 'init-js)
;;; init-js.el ends here
