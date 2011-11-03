(setq inhibit-startup-message t)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(unless window-system
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))

(add-to-list 'default-frame-alist '(font . "DejaVu LGC Sans Mono-10"))

;; Don't auto-indent with tabs by default
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
