;;; init-markdown.el --- markdown configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-when-compile (require 'init-use-package))
(use-package markdown-mode
  :ensure t
  :mode
  (("\\.md\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode)))

(provide 'init-markdown)
;;; init-markdown.el ends here
