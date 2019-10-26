;;; init-path.el --- exec path initialization -*- lexical-binding: t -*-

(when (package-installed-p 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

(provide 'init-path)
;;; init-path.el ends here
