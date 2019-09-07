;;; init-theme.el --- customize theme -*- lexical-binding: t -*-

(require 'color-theme-sanityinc-tomorrow)

(setq-default custom-enabled-themes '(sanityinc-tomorrow-bright))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme))))

(add-hook 'after-init-hook 'reapply-themes)

(provide 'init-theme)
;;; end-of init-theme
