;;; init-python.el --- python configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)
(use-package python
  :config
  (cond ((eq system-type 'darwin)	; Pick 'python3' from Homebrew,
	 (custom-set-variables		; this supports readline
	  '(python-shell-interpreter
	    "/usr/local/opt/python@3/bin/python3")))
	(t
	 (custom-set-variables
	  '(python-shell-interpreter "python3"))))
  :hook
  ((python-mode . flymake-mode)
   (python-mode . display-line-numbers-mode)
   (python-mode . hs-minor-mode)
   (python-mode . abbrev-mode)))

(provide 'init-python)
;;; init-python.el ends here
