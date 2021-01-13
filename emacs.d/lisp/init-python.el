;;; init-python.el --- python configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar python-shell-interpreter)
(if (and (eq system-type 'darwin) (executable-find "ipython"))
    (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter "python3"))

(defvar python-indent-guess-indent-offset-verbose nil)

(add-hook 'python-mode-hook #'display-line-numbers-mode)
(add-hook 'python-mode-hook #'hs-minor-mode)
(add-hook 'python-mode-hook #'abbrev-mode)

(provide 'init-python)
;;; init-python.el ends here
