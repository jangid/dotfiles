;;; init-browser.el --- configure browser -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(setq browse-url-browser-function 'eww-browse-url)
;; (setq shr-color-visible-distance-min 100)
(defvar shr-color-visible-luminance-min)
(setq shr-color-visible-luminance-min 70)

(provide 'init-browser)
;;; init-browser.el ends here
