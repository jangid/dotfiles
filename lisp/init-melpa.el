;;; init-melpa.el --- add MELPA source -*- lexical-binding: t -*-

;; This line initializes all the installed packages.
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (package-refresh-contents t)

(provide 'init-melpa)
;;; end-of init-melpa.el
