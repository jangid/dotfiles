;;; init-prog.el --- programmer's configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; ideally, push list of required packages to 'essential-packages
;; defined in init-pack.el

(when (package-installed-p 'company)
  (require 'company)
  (add-hook 'prog-mode-hook #'company-mode))

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'prog-mode-hook #'electric-pair-mode)
(add-hook 'prog-mode-hook #'flyspell-prog-mode)

(require 'flymake)
(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)

(require 'projectile)
(add-hook 'prog-mode-hook #'projectile-mode)
(setq projectile-completion-system 'ivy)
(setq ivy-use-virtual-buffers t)

;; projectile settings
;; (setq projectile-project-search-path '("~/work/code"))
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)

(require 'init-elisp)
(require 'init-java)
(require 'init-python)
(require 'init-rust)
(require 'init-lua)

(provide 'init-prog)
;;; init-prog.el ends here
