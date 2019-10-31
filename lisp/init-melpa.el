;;; init-melpa.el --- add MELPA source -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; This line initializes all the installed packages.
;; (eval-when-compile (package-initialize))
(package-initialize)

(provide 'init-melpa)
;;; init-melpa.el ends here
