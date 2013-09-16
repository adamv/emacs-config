;;; Key remaps
;;; Many of these don't work in console mode, only X.

(global-set-key (kbd "C-S-v") 'scroll-down)
(global-set-key (kbd "C-v") 'scroll-up)

(global-set-key [C-home] "\M-<")
(global-set-key [C-end] "\M->")

;(global-set-key (kbd "C-S-k") 'delete-region)

(global-set-key [C-tab] 'other-window)

(when window-system
  ;; toggle menu-bar visibility
  (global-set-key (kbd "<f12>") 'menu-bar-mode)

  ;; No suspend in GUI mode
  (global-unset-key (kbd "C-x C-z"))
)


;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


;; f3 in minibuf inserts active buffer's filename
;; http://stackoverflow.com/questions/455345/in-emacs-how-to-insert-file-name-in-shell-command
(define-key minibuffer-local-map
  [f3] (lambda () (interactive)
       (insert (buffer-name (current-buffer-not-mini)))))

(defun current-buffer-not-mini ()
  "Return current-buffer if current buffer is not the *mini-buffer*
  else return buffer before minibuf is activated."
  (if (not (window-minibuffer-p)) (current-buffer)
      (if (eq (get-lru-window) (next-window))
          (window-buffer (previous-window)) (window-buffer (next-window)))))


;; Fix forward-delete on X11 on OS X
(global-set-key [delete] 'delete-forward-char)
