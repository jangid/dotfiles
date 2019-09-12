;; init-direnv.el --- load environment for directory -*- lexical-binding: t -*-

(when (package-installed-p 'direnv)
  (add-hook 'after-init-hook 'direnv-mode))

(provide 'init-direnv)
