;; init-org.el --- org mode configuration -*- lexical-binding: t -*-

(when (package-installed-p 'org)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  (global-set-key (kbd "C-c b") 'org-switchb))


(provide 'init-org)
;; end-of init-org.el
