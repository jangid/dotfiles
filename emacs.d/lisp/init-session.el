;;; init-session.el --- emacs sessions -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar sessions-directory
  (file-name-as-directory
   (concat user-emacs-directory "sessions"))
  "Directory to store Emacs desktop sessions and minibuffer history.")

(require 'desktop)
(setq desktop-restore-eager 5)
(add-to-list 'desktop-path sessions-directory)
(setq desktop-base-file-name "emacs.desktop") ; not a hidden file
(desktop-save-mode +1)

(eval-when-compile (require 'savehist))
(setq savehist-file
      (concat sessions-directory "history"))
(savehist-mode +1)

(provide 'init-session)
;;; init-session.el ends here
