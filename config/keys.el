;;; Key remaps
;;; Many of these don't work in console mode, only X.

(global-set-key (kbd "C-S-v") 'scroll-down)
(global-set-key (kbd "C-v") 'scroll-up)

(global-set-key [C-home] "\M-<")
(global-set-key [C-end] "\M->")

;(global-set-key (kbd "C-S-k") 'delete-region)

(global-set-key [C-tab] 'other-window)

;; toggle menu-bar visibility
(global-set-key (kbd "<f12>") 'menu-bar-mode)


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
