;;; init-website.el --- my website -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar site-project-dir
  "~/work/code/github/codeisgreat/"	; *do not* remove training slash
  "My webstie.")

(defvar org-publish-project-alist
  '(("website"
     :components ("pages" "blog"))
    ("pages"
     :base-directory "~/work/code/github/codeisgreat/src/"
     :publishing-directory "~/work/code/github/codeisgreat/docs/"
     :publishing-function org-html-publish-to-html)
    ("blog"
     :base-directory "~/work/code/github/codeisgreat/src/blog"
     :publishing-directory "~/work/code/github/codeisgreat/docs/blog"
     :publishing-function org-html-publish-to-html))
  "My website project.")

(provide 'init-website)
;;; init-website.el ends here
