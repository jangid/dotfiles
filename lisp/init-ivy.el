;; init-ivy.el --- ivy mode configuration -*- lexical-binding: t -*-

(when (package-installed-p 'ivy)
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(provide 'init-ivy)
;; end-of init-ivy.el
