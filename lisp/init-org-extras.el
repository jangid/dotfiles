;;; init-org-extras.el --- configure org-extras -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)
(use-package org-mime
  :ensure t
  :defer t)
(use-package org-superstar
  :ensure t
  :defer t)

(provide 'init-org-extras)
;;; init-org-extras.el ends here
