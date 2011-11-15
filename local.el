;; custom place to save customizations
;; See: http://www.gnu.org/s/libtool/manual/emacs/Saving-Customizations.html
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (load custom-file))


(setq inhibit-startup-message t)

;; UI widgets
;; No toolbar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; Show menu in GUI mode, but not terminal mode
(unless window-system
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))

(setq line-number-mode t)
(setq column-number-mode t)

;; Fonts
(add-to-list 'default-frame-alist '(font . "DejaVu LGC Sans Mono-10"))

;; Indents
;; 4 space indents
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Color themes
(load "themes/color-theme-tomorrow")
(color-theme-tomorrow-night)

;; Key remaps
;; These don't work in console mode, only X
(global-set-key (kbd "C-S-v") 'scroll-down)
(global-set-key (kbd "C-v") 'scroll-up)
(global-set-key [C-home] "\M-<")
(global-set-key [C-end]  "\M->")

(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode)


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
