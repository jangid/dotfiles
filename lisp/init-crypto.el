;;; init-crypto.el --- configure GnuPG -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; GnuPG configuration
(eval-when-compile (require 'epg))
(setq epg-pinentry-mode 'loopback)

;;(custom-set-variables
;; '(epg-gpg-program  "/usr/local/bin/gpg"))

;; Configure mml - sign and encrypt key
;; (eval-when-compile (require 'mml-sec))
(eval-when-compile (require 'mml-sec))
(setq mml-secure-openpgp-encrypt-to-self t)
(setq mml-secure-openpgp-signers '("7C956E6FF8587689"))

(provide 'init-crypto)
;;; init-crypto.el ends here
