;;; init-use-package.el --- setup use-package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

;; MELPA stable repositlry
(eval-when-compile
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/")))

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(eval-when-compile (package-initialize))

(provide 'init-use-package)
;;; init-use-package.el ends here
