(setq pkgs-all (list 'diminish))
(setq pkgs-to-install (list))

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("elpa"   . "https://elpa.gnu.org/packages/")
	("nongnu" . "http://elpa.nongnu.org/nongnu/")))

(eval-when-compile (package-initialize))

;; (message "PackagesAll %s" pkgs-all)

(require 'package)
(dolist (pkg pkgs-all)		; prepare list
  ;; (message "checking %s" pkg)
  (unless (package-installed-p pkg)
    ;; (message "%s not installed." pkg)
    (push pkg pkgs-to-install)
    ;; (message "Added to list.")
    ))

;; (message "PackageToInstall %s" pkgs-to-install)

(unless (null pkgs-to-install)	; packages to install?
    (progn
      (package-refresh-contents)
      (dolist (pkg pkgs-to-install)
	(package-install pkg))))
