;;; init-crypto.el --- configure GnuPG -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; GnuPG configuration
(defvar epg-pinentry-mode 'loopback)

(defvar mml-secure-openpgp-encrypt-to-self t)
(defvar mml-secure-openpgp-signers '("7C956E6FF8587689"))

(provide 'init-crypto)
;;; init-crypto.el ends here
