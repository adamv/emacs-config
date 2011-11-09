(setq inhibit-startup-message t)

;; UI widgets
;; No toolbar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; Show menu in GUI mode, but not terminal mode
(unless window-system
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))

;; Fonts
(add-to-list 'default-frame-alist '(font . "DejaVu LGC Sans Mono-10"))

;; Indents
;; 4 space indents
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Color themes
(load "themes/color-theme-tomorrow")
(color-theme-tomorrow-night)
