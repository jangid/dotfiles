;;; init-melpa.el --- add MELPA source -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(package-refresh-contents t)

(setq essential-packages
      '(exec-path-from-shell
	color-theme-sanityinc-tomorrow
	w3m))

(defun install-essential-packages()
  "Install the package from `essential-packages'"
  (package-refresh-contents)
  (dolist (package essential-packages)
    (unless (package-installed-p package)
      (package-install package))))

;; (install-essential-packages)

(provide 'init-melpa)
;;; end-of init-melpa.el
