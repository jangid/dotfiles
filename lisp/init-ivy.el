;; init-ivy.el --- ivy mode configuration -*- lexical-binding: t -*-

;; (when (package-installed-p 'ivy)
;;   (add-hook 'after-init-load
;; 	    '((ivy-mode 1)
;; 	      (setq ivy-use-virtual-buffers t)
;; 	      (setq enable-recursive-minibuffers t))))

;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)

(ivy-mode 1)

(provide 'init-ivy)
;;; init-ivy.el ends here
