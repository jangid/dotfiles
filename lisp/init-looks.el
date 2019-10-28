;;; init-looks.el --- customize emacs looks -*- lexical-binding: t -*-

;; theme
(setq-default custom-enabled-themes '(sanityinc-tomorrow-bright))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme))))

(add-hook 'after-init-hook 'reapply-themes)

;; Disable menu-bar, tool-bar and scroll-bar. What is the use of emacs
;; if you are using these mouseee features.
(defun enable-mousee-features ()
    "Enable UI features to be used with mouse."
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1))

(defun disable-mousee-features ()
    "Disable UI features which are used with mouse."
  (menu-bar-mode t)
  (toggle-scroll-bar t)
  (tool-bar-mode t))

(disable-mousee-features)

(provide 'init-looks)
;;; init-looks.el ends here
