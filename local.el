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

