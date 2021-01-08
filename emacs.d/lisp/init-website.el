;;; init-website.el --- my website -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar site-project-dir
  "~/work/code/github/codeisgreat/"	; *do not* remove training slash
  "My webstie.")

(defvar org-publish-project-alist
  `(("website"
     :components ("pages" "articles" "images" "other"))
    ("pages"
     :base-directory ,(concat site-project-dir "src/")
     :publishing-directory ,(concat site-project-dir "docs/")
     :publishing-function org-html-publish-to-html)
    ("articles"
     :base-directory ,(concat site-project-dir "src/articles")
     :publishing-directory ,(concat site-project-dir "docs/articles")
     :publishing-function org-html-publish-to-html)
    ("images"
     :base-directory ,(concat site-project-dir "src/images")
     :publishing-directory ,(concat site-project-dir "docs/images")
     :publishing-function org-publish-attachment)
    ("other"
     :base-directory ,(concat site-project-dir "src/other")
     :publishing-directory ,(concat site-project-dir "docs/other")
     :publishing-function org-publish-attachment))
  "My website project.")

(provide 'init-website)
;;; init-website.el ends here
