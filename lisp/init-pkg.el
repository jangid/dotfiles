;;; init-pkg.el --- compile time pkg -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; MELPA stable repositlry
(eval-when-compile (require 'package))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(eval-when-compile (package-initialize))

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))

;; Directory to hold modular lisp files
(eval-when-compile
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)))

(provide 'init-pkg)

;;; init-pkg.el ends here
