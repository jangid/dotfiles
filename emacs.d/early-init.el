;;; early-init.el --- before init.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; Environment
(add-to-list 'exec-path "/sbin")
(add-to-list 'exec-path "/usr/sbin")
(add-to-list 'exec-path "/bin")
(add-to-list 'exec-path "/usr/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/Users/pankaj/go/bin")
(add-to-list 'exec-path "/Library/TeX/texbin")
(add-to-list 'exec-path "/Library/Apple/usr/bin")
(add-to-list 'exec-path "/Users/pankaj/.cargo/bin")
(add-to-list 'exec-path
             "/Users/pankaj/.sdkman/candidates/ant/current/bin")
(add-to-list 'exec-path
             "/Users/pankaj/.sdkman/candidates/gradle/current/bin")
(add-to-list 'exec-path
             "/Users/pankaj/.sdkman/candidates/groovy/current/bin")
(add-to-list 'exec-path
             "/Users/pankaj/.sdkman/candidates/kotlin/current/bin")
;; (add-to-list 'exec-path
;;              "/usr/local/opt/gcc/bin")

(setenv "PATH" (mapconcat 'identity exec-path ":"))
(setenv "RUST_SRC_PATH"
    "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/")

(setenv "LANG" "en_US.UTF-8")


(provide 'early-init)
;;; early-init.el ends here
