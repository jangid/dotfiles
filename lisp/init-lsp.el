;;; init-lsp.el --- lsp configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'company)

(with-eval-after-load 'company
  (push 'company-lsp company-backends))

(provide 'init-lsp)
;;; init-lsp.el ends here
