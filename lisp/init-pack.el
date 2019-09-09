;;; init-pack.el --- essential packages -*- lexical-binding: t -*-

(setq essential-packages
      '(exec-path-from-shell
	color-theme-sanityinc-tomorrow
	w3m
	flycheck))

(defun install-essential-packages ()
  "Install the package from `essential-packages'"
  (interactive)
  (package-refresh-contents)
  (dolist (package essential-packages)
    (unless (package-installed-p package)
      (package-install package))))

;; (install-essential-packages)

(provide 'init-pack)
;;; end-of init-pack.el
