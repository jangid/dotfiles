;;; init-use-package.el --- use-package conf -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-and-compile
  (prog1 "use-package"
    (package-initialize)
    (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))
    (require 'use-package)))

(provide 'init-use-package)
;;; init-use-package.el ends here
