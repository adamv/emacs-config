;;; UI

(setq inhibit-startup-message t)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(unless window-system
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))

(blink-cursor-mode -1)

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; make the fringe (gutter) smaller
;; the argument is a width in pixels (the default is 8)
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Fonts
(if (string-equal system-type "darwin")
    (add-to-list 'default-frame-alist '(font . "DejaVu LGC Sans Mono-10"))
)
