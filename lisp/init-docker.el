;;; init-docker.el --- docker configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-use-package)
(use-package dockerfile-mode
  :ensure t)
(use-package docker-compose-mode
  :ensure t)

(provide 'init-docker)
;;; init-docker.el ends here
