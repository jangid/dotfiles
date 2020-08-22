;;; init-completion.el --- configure completion -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

(use-package which-key
  :ensure t)

;; fake-ido. fido-mode also enables icomplete-mode.
;; now only icomplete-mode enabled.
(icomplete-mode +1)

(provide 'init-completion)
;;; init-completion.el ends here
