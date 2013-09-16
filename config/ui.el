;;; UI

(setq inhibit-startup-message t)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(unless window-system
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))

(unless window-system
  ;; Enable mouse in terinal mode
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e))
  (setq mouse-sel-mode t)

  ;; Enable shift-select in iTerm2
  (add-hook 'term-setup-hook
            '(lambda ()
               (define-key function-key-map "\e[1;9A" [M-up])
               (define-key function-key-map "\e[1;9B" [M-down])
               (define-key function-key-map "\e[1;9C" [M-right])
               (define-key function-key-map "\e[1;9D" [M-left])))
)


;; Show tips in minibuffer, not windows
(tooltip-mode 0)


(blink-cursor-mode -1)

;; Don't ever make audible sounds.
(setq visible-bell 't)
;; Don't flash either
(setq ring-bell-function 'ignore)

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

;; bigger window
(add-to-list 'default-frame-alist '(width . 120))
(add-to-list 'default-frame-alist '(height . 35))
