;;; init-lua.el --- lua configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'lua-mode)
(require 'luarocks)
(require 'flymake-lua)

(add-hook 'lua-mode-hook #'flymake-lua-load)

(require 'company-lua)
(push 'company-lua company-backends)

(provide 'init-lua)
;;; init-lua.el ends here
