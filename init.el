;;; Additional load paths
(add-to-list 'load-path "~/.emacs.d")
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
(load-file "~/.emacs.d/config/modes.el")


;; Fonts
(add-to-list 'default-frame-alist '(font . "DejaVu LGC Sans Mono-10"))


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
