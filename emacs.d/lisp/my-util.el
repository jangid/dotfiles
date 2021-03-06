;;; my-util.el --- utility functions  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'cl-lib)

(defun add-to-classpath (item)
  "Add ITEM to CLASSPATH."
  
  (let ((class-path (getenv "CLASSPATH")))
    
    (defvar class-path-list (if class-path
				(split-string class-path ":")))
    (cl-pushnew item class-path-list)
    (setenv "CLASSPATH"
	    (mapconcat 'identity class-path-list ":"))))

(defun my/set-email-xface ()
  "Add Face header to email message."
  (interactive)
    (progn
    (declare-function message-add-header "message.el")
    (message-add-header
     (concat "Face: "
	     (gnus-face-from-file "face.png")))))

(defun my/unset-email-xface ()
  "Remove Face field."
  (interactive)
  (progn
    (declare-function message-remove-header "message.el")
    (message-remove-header "Face")))

(defun my/cycle-frame-width ()
  "Cycle \"frame-width\"."
  (interactive)
  
  (let ((width (frame-width)))
    
    (cond ((eq width 80) (set-frame-width nil 120))
          ((eq width 120) (set-frame-width nil 160))
	      (t (set-frame-width nil 80))) ; default
    
    (message "Frame size: %sx%s" (frame-width) (frame-height))))

(defun my/cycle-frame-height ()
  "Cycle \"frame-height\"."
  (interactive)
  
  (let ((height (frame-height)))
    
    (cond ((eq height 38) (set-frame-height nil 43))
          ((eq height 43) (set-frame-height nil 48))
	      (t (set-frame-height nil 38))) ; default
    
    (message "Frame size: %sx%s" (frame-width) (frame-height))))

(defun my/cycle-frame-size ()
  "Cycle frame-size."
  (interactive)
  
  (let ((width (frame-width))
	    (height (frame-height)))
    
    (cond ((and (eq width 80) (eq height 38))
	       (set-frame-size nil 120 38))
	      ((and (eq width 120) (eq height 38))
           (set-frame-size nil 120 43))
	      ((and (eq width 120) (eq height 43))
           (set-frame-size nil 160 43))
          ((and (eq width 160) (eq height 43))
           (set-frame-size nil 160 48))
	      (t (set-frame-size nil 80 38))) ; default
    
    (message "Frame size: %sx%s" (frame-width) (frame-height))))

;; TODO read nickname, fullname from file
(defun my/erc-connect-freenode ()
  "Connect to chat.freenode.net."
  (interactive)
  (erc :server "chat.freenode.net"
       :port 6667
       :nick "jangid"
       :full-name "Pankaj Jangid"))

(defun my/erc-connect-oftc ()
  "Connect to irc.oftc.net."
  (interactive)
  (erc :server "irc.oftc.net"
       :port 6667
       :nick "jangid"
       :full-name "Pankaj Jangid"))

(defun my/erc-connect-gitter ()
  "Connect to irc.gitter.im."
  (interactive)
  (erc-tls :server "irc.gitter.im"
	   :port 6667
	   :nick "jangid"
	   :full-name "Pankaj Jangid"))

(provide 'my-util)
;;; my-util.el ends here
