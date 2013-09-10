;;; Additional load paths
(add-to-list 'load-path "~/.emacs.d/adamv")
(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/vendor")

;; custom place to save customizations
;; See: http://www.gnu.org/s/libtool/manual/emacs/Saving-Customizations.html
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (load custom-file))


;; TODO - break these into some separate files I guess

(setq inhibit-startup-message t)

;; UI widgets
;; No toolbar or scrollbar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Show menu in GUI mode, but not terminal mode
(unless window-system
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))

(if window-system
  (global-unset-key (kbd "C-x C-z")))


(setq line-number-mode t)
(setq column-number-mode t)


;; Textmate Mode
(require 'textmate)
(textmate-mode)


;; Editing
;; make typing overwrite text selection
(delete-selection-mode 1) ; this turns on transient-mark-mode automatically

;; Fonts
(add-to-list 'default-frame-alist '(font . "DejaVu LGC Sans Mono-10"))

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Whitepace
;; (setq require-final-newline t) ; auto-insert final newlines in all files
(setq-default show-trailing-whitespace t) ; highlight trailing whitespace

;; Indents
;; 4 space indents
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)


;; Key remaps
;; Many of these don't work in console mode, only X.
(global-set-key (kbd "C-S-v") 'scroll-down)
(global-set-key (kbd "C-v") 'scroll-up)
(global-set-key [C-home] "\M-<")
(global-set-key [C-end] "\M->")
(global-set-key (kbd "C-S-k") 'delete-region)
(global-set-key [C-tab] 'other-window)

; toggle menu-bar visibility
(global-set-key (kbd "<f12>") 'menu-bar-mode)

; f3 in minibuf inserts active buffer's filename
; http://stackoverflow.com/questions/455345/in-emacs-how-to-insert-file-name-in-shell-command
(define-key minibuffer-local-map
  [f3] (lambda () (interactive)
       (insert (buffer-name (current-buffer-not-mini)))))

(defun current-buffer-not-mini ()
  "Return current-buffer if current buffer is not the *mini-buffer*
  else return buffer before minibuf is activated."
  (if (not (window-minibuffer-p)) (current-buffer)
      (if (eq (get-lru-window) (next-window))
          (window-buffer (previous-window)) (window-buffer (next-window)))))


;; Color themes
; Zenburn
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

; Solarized
(load "themes/color-theme-tomorrow")
(load "themes/color-theme-solarized")
;(color-theme-tomorrow-night)
;(color-theme-solarized-dark)

(color-theme-solarized-light)

;; don't clutter the workspace with a bunch of backups
(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))
(setq auto-save-default nil)


;; File types
(add-to-list 'auto-mode-alist '("/zshrc$" . sh-mode))

;; Editing - C
(c-set-offset 'innamespace 0)
(setq c-basic-offset 4)
