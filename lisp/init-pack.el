;;; init-pack.el --- essential packages -*- lexical-binding: t -*-

(require 'package)

(defvar essential-packages)
(setq essential-packages
      '(exec-path-from-shell
	color-theme-sanityinc-tomorrow
	magit
	gnuplot
	gnuplot-mode
	org-bullets
	org-babel-eval-in-repl
	org-mime
	lua-mode
	luarocks
	flymake-rust
	flymake-lua
	projectile
	treemacs
	treemacs-projectile
	treemacs-magit
	treemacs-icons-dired
	bbdb
	htmlize
	json-mode
	which-key
	diminish
	ivy
	ripgrep
	direnv
	rust-mode
	company
	company-jedi
	company-lsp
	company-lua
	lsp-mode
	lsp-java
	use-package
	yasnippet
	dap-mode))

(defun install-essential-packages ()
  "Install the package from `essential-packages'."
  (interactive)
  (package-refresh-contents)
  (dolist (package essential-packages)
    (unless (package-installed-p package)
      (package-install package)))
  (message "Installed essential packages."))

(provide 'init-pack)
;;; init-pack.el ends here
