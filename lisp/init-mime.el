;;; init-mime.el --- mime configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar mailcap-user-mime-data
  `(("application"
     ("vnd\\.ms-excel"
      (viewer . "/Applications/Microsoft\\ Excel\\.app/Contents/MacOS/Microsoft\\ Excel
 %s")
      (test   . t)
      (type . "application/vnd.ms-excel")))))

(provide 'init-mime)
;;; init-mime.el ends here
