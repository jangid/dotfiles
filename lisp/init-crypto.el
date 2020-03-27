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
(setq mml-secure-openpgp-signers '("0B6274243B26A911052ADDE67C956E6FF8587689"))

(provide 'init-crypto)
;;; init-crypto.el ends here
