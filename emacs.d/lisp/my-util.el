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

(defun my/set-face ()
  "Add Face header to email message."
  (interactive)
    (progn
    (declare-function message-add-header "message.el")
    (message-add-header
     (concat "Face: "
	     (gnus-face-from-file "face.png")))))

(defun my/unset-face ()
  "Remove Face field."
  (interactive)
  (progn
    (declare-function message-remove-header "message.el")
    (message-remove-header "Face")))

(defun modus-theme-toggle ()
  "Toggle between modus-operandi and modus-vivendi themes."
  (interactive)
  (if (member 'modus-operandi custom-enabled-themes)
      (progn
	(disable-theme 'modus-operandi)
	(load-theme 'modus-vivendi t))
    (disable-theme 'modus-vivendi)
    (load-theme 'modus-operandi t)))

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

(defun my-install-or-update ()
  "Install selected packages."
  (interactive)
  (eval-when-compile (require 'package))
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))
  (package-refresh-contents)
  (package-install-selected-packages))

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

;; Org
(defun my-org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (declare-function org-goto-sibling "org.el")
  (declare-function org-get-todo-state "org.el")
  (declare-function outline-next-heading "outline.el")

  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))
		  
(defun org-current-is-todo ()
  "Check if the currect node is in todo state."
  (string= "TODO" (org-get-todo-state)))

(provide 'my-util)
;;; my-util.el ends here
