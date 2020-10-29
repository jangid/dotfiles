;;; init-crypto.el --- configure GnuPG -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)
(use-package pinentry
  :ensure t)

;; GnuPG configuration
(eval-when-compile (require 'epg))
(setq epg-pinentry-mode 'loopback)

(eval-when-compile (require 'mml-sec))
(setq mml-secure-openpgp-encrypt-to-self t)
(setq mml-secure-openpgp-signers '("7C956E6FF8587689"))

(provide 'init-crypto)
;;; init-crypto.el ends here
