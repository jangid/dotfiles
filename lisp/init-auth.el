;;; init-auth.el --- auth conf -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'auth-source))
(setq auth-sources '("~/.authinfo.gpg"))

(provide 'init-auth)
;;; init-auth.el ends here
