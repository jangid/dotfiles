;;; init-website.el --- my website -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar site-project-dir
  "~/work/code/github/codeisgreat/"	; *do not* remove training slash
  "My webstie.")

(defvar org-publish-project-alist
  `(("website"
     :components ("pages" "articles"))
    ("pages"
     :base-directory ,(concat site-project-dir "src/")
     :publishing-directory ,(concat site-project-dir "docs/")
     :publishing-function org-html-publish-to-html)
    ("articles"
     :base-directory ,(concat site-project-dir "src/articles")
     :publishing-directory ,(concat site-project-dir "docs/articles")
     :publishing-function org-html-publish-to-html))
  "My website project.")

(provide 'init-website)
;;; init-website.el ends here
