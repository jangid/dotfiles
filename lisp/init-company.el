;; init-company.el --- completion framework -*- lexical-binding: t -*-

(when (package-installed-p 'company)
  (add-hook 'after-init-hook 'global-company-mode))

(provide 'init-company)
;; end-of init-company.el
