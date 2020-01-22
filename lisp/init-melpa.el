;;; init-melpa.el --- add MELPA source -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'package))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(defvar essential-packages)
(setq essential-packages
      '(exec-path-from-shell
	gnuplot
	gnuplot-mode
	org-bullets
	org-babel-eval-in-repl
	org-mime
	projectile
	lua-mode
	luarocks
	bbdb
	htmlize
	json-mode
	which-key
	diminish
	ripgrep
	direnv
	rust-mode
	company
	company-quickhelp
	use-package
	yasnippet))

(defun install-essential-packages ()
  "Install the package from `essential-packages'."
  (interactive)
  (package-refresh-contents)
  (dolist (package essential-packages)
    (unless (package-installed-p package)
      (package-install package)))
  (message "Installed essential packages."))

;; This line initializes all the installed packages.
;; (eval-when-compile (package-initialize))
(if (< emacs-major-version 27)
    (package-initialize)
  (eval-when-compile (package-initialize)))

(provide 'init-melpa)
;;; init-melpa.el ends here
