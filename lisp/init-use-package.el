;;; init-use-package.el --- setup use-package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

(eval-when-compile (package-initialize))

(provide 'init-use-package)
;;; init-use-package.el ends here
