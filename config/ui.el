;;; UI

(setq inhibit-startup-message t)


(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(unless window-system
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))


(setq line-number-mode t)
(setq column-number-mode t)
