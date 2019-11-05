;;; init-rust.el --- rust setup -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'rust-mode-hook #'flymake-rust-load)
(setq flymake-rust-use-cargo 1)

(add-hook 'rust-mode-hook #'lsp)

(provide 'init-rust)
;;; init-rust.el ends here
