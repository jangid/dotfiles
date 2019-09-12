;;; init-python.el --- python specific configuration -*- lexical-binding: t -*-

(with-eval-after-load 'init-pack
  (message "After init-pack"))

(with-eval-after-load 'company
  (when (package-installed-p 'company-jedi)
    (unless (member 'company-jedi company-backends)
      (add-to-list 'company-backends 'company-jedi))))

(with-eval-after-load 'company-jedi (jedi:install-server))
  
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(provide 'init-python)
;;; end-of init-python.el
