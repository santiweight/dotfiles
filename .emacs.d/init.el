;; -*- mode: elisp -*-

(require 'package)
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

;; Define is-a-mac bool if this is a mac
(defconst *is-a-mac* (eq system-type 'darwin))

;; Inherit shell path
(if *is-a-mac*
    (add-hook 'after-init-hook 'exec-path-from-shell-initialize))

;; Disable the splash screen (to enable it agin, replace the t with 0)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

(require-package 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "f" 'find-file)
(evil-leader/set-key "o" '(lambda() (interactive)(find-file "~/Documents/org/")))
(evil-leader/set-key "i" '(lambda() (interactive)(find-file "~/dotfiles/.emacs.d/init.el")))


(require-package 'bind-key)
(defun files-in-below-directory (directory)
       "List the .el files in DIRECTORY and in its sub-directories."
       ;; Although the function will be used non-interactively,
       ;; it will be easier to test if we make it interactive.
       ;; The directory will have a name such as
       ;;  "/usr/local/share/emacs/22.1.1/lisp/"
       (interactive "DDirectory name: ")
       (let (el-files-list
             (current-directory-list
              (directory-files-and-attributes directory t)))
         ;; while we are in the current directory
         (while current-directory-list
           (cond
            ;; check to see whether filename ends in '.el'
            ;; and if so, add its name to a list.
            ((equal ".org" (substring (car (car current-directory-list)) -3))
             (setq el-files-list
                   (cons (car (car current-directory-list)) el-files-list)))
            ;; check whether filename is that of a directory
            ((eq t (car (cdr (car current-directory-list))))
             ;; decide whether to skip or recurse
             (if
                 (equal "."
                        (substring (car (car current-directory-list)) -1))
                 ;; then do nothing since filename is that of
                 ;;   current directory or parent, "." or ".."
                 ()
               ;; else descend into the directory and repeat the process
               (setq el-files-list
                     (append
                      (files-in-below-directory
                       (car (car current-directory-list)))
                      el-files-list)))))
           ;; move to the next filename in the list; this also
           ;; shortens the list so the while loop eventually comes to an end
           (setq current-directory-list (cdr current-directory-list)))
         ;; return the filenames
         el-files-list))

;;;;Org mode configuration
;; Enable Org mode
(require-package 'org)
;; Make Org mode work with files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/Documents/org/Expenses.org"
			     "~/Documents/org/Film-Ideas.org"
			     "~/Documents/org/TODO.org"))

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Evil mode configuration
(add-to-list 'load-path "~/.emacs.d/evil")
(require-package 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-input-autoexpand (quote history))
 '(org-agenda-files (quote ("~/Documents/Film-Ideas.org")))
 '(package-selected-packages
   (quote
    (exec-path-from-shell gotest buffer-move anaconda-mode company linum-relative mines undo-tree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require-package 'undo-tree)



;; Code to allow lines to be moved up/down <M-up> and <M-down>
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

(define-globalized-minor-mode global-linum-relative-mode linum-relative-mode
  (lambda () (linum-relative-mode 1)))

(global-linum-relative-mode 1)

;; Make company autocomplete global
(add-hook 'after-init-hook 'global-company-mode)

;; Make all python buffers use anaconda mode
(require-package 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)

;; buffer-move allows buffers to be switched around
(require-package 'buffer-move)
(global-set-key (kbd "<C-M-up>")     'buf-move-up)
(global-set-key (kbd "<C-M-down>")   'buf-move-down)
(global-set-key (kbd "<C-M-left>")   'buf-move-left)
(global-set-key (kbd "<C-M-right>")  'buf-move-right)

;; Have shell open in current window
(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)

;; Have C-x C-b open  ibuffer instead of  list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;  Attempt at adding colorful ls
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Change color scheme to utf-8
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq locale-coding-system 'utf-8)

(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8))

;; moving autosaves
(defvar --backup-directory (concat user-emacs-directory "gen/auto-save/"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      vc-make-backup-files t
      )

;; add a customization file
(defvar --custom-file-path (concat user-emacs-directory "custom.el"))
(setq custom-file --custom-file-path)
(load custom-file)


(setq calendar-week-start-day 1)

(setq org-todo-keywords
      '((sequence "TODO(t)" "VERIFY(v)" "WAITING(w)" "|" "DONE(d)")
	(sequence "Lecture(l)" "|" "Attended(a)" "Canceled(x)")))


(setq tramp-default-method "ssh")


(setq max-specpdl-size 1000)  ; default is 1000, reduce the backtrace level
(setq debug-on-error t)

(setq org-modules '(org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m org-eshell org-toc))

(bind-key "C-c i" #'(lambda() (interactive)(find-file "~/dotfiles/.emacs.d/init.el")))
(bind-key "C-c o" #'(lambda() (interactive)(find-file "~/Documents/org/")))

(bind-key "<s-up>" #'previous-buffer)
(bind-key "<s-down>" #'next-buffer)

(bind-key "s-/" #'company-complete)

(add-hook 'org-mode-hook 
          (lambda ()
            (local-set-key "\M-n" 'outline-next-visible-heading)
            (local-set-key "\M-p" 'outline-previous-visible-heading)
            ;; table
            (local-set-key "\C-\M-w" 'org-table-copy-region)
            (local-set-key "\C-\M-y" 'org-table-paste-rectangle)
            (local-set-key "\C-\M-l" 'org-table-sort-lines)
            ;; display images
            (local-set-key "\M-I" 'org-toggle-iimage-in-org)
            ;; fix tab
            (local-set-key "\C-b" 'org-next-visible-heading)))

(require-package 'auctex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(require-package 'latex-preview-pane)
(latex-preview-pane-enable)
