;;; Additional load paths
(add-to-list 'load-path "~/.emacs.d/adamv")
(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/vendor")

;; custom place to save customizations
;; See: http://www.gnu.org/s/libtool/manual/emacs/Saving-Customizations.html
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (load custom-file))


;; TODO - break these into some separate files I guess

(load-file "~/.emacs.d/config/ui.el")
(load-file "~/.emacs.d/config/keys.el")
(load-file "~/.emacs.d/config/editing.el")

;; Textmate Mode
(require 'textmate)
(textmate-mode)


;; Fonts
(add-to-list 'default-frame-alist '(font . "DejaVu LGC Sans Mono-10"))


;; Editing
;; make typing overwrite text selection
(delete-selection-mode 1) ; this turns on transient-mark-mode automatically

;; Whitepace
;; (setq require-final-newline t) ; auto-insert final newlines in all files
(setq-default show-trailing-whitespace t) ; highlight trailing whitespace

;; Indents
;; 4 space indents
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)


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
