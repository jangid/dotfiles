;;; init-crypto.el --- configure GnuPG -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-pkg)

;; GnuPG configuration
(eval-when-compile (require 'epg))
(setq epg-pinentry-mode 'loopback)

;; Configure mml - sign and encrypt key
(eval-when-compile (require 'mml-sec))
(setq mml-secure-openpgp-encrypt-to-self t)
(setq mml-secure-openpgp-signers '("7C956E6FF8587689" "65FDA0A10D6D02F1"))

(provide 'init-crypto)
;;; init-crypto.el ends here
