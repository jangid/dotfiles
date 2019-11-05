;;; init-env.el --- set environment -*-lexical-mode: t-*-

(exec-path-from-shell-initialize)
(add-hook 'after-init-hook 'direnv-mode)

(provide 'init-env)
;;; init-env.el ends here
