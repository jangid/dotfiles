;;; init-speedbar.el --- speedbar configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'speedbar-load-hook (lambda () (require 'semantic/sb)))

(provide 'init-speedbar)
;;; init-speedbar.el ends here
