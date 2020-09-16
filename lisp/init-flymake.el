;;; init-flymake.el --- flymake configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'flymake)
(global-set-key (kbd "M-n") #'flymake-goto-next-error)
(global-set-key (kbd "M-p") #'flymake-goto-prev-error)

(provide 'init-flymake)
;;; init-flymake.el ends here
