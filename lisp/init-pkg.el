;;; init-pkg.el --- compile time pkg -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Directory to hold modular lisp files
(eval-when-compile
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)))

;; MELPA repositlry
(eval-when-compile (require 'package))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(provide 'init-pkg)

;;; init-pkg.el ends here
