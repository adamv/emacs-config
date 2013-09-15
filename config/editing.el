;;; Editing

;; make typing overwrite text selection
(delete-selection-mode 1) ; this turns on transient-mark-mode automatically

;;; Whitepace
(global-whitespace-mode t)
(setq whitespace-style '(face trailing tabs lines-tail tab-mark))

;; Indents
;; 4 space indents
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;;; File types
(add-to-list 'auto-mode-alist '("/zshrc$" . sh-mode))

;;; Editing - C
(require 'cc-mode)
(c-add-style "js"
             '("bsd"
               (indent-tabs-mode . nil)
               (c-basic-offset . 4)
               (tab-width . 4)
	           (c-continued-statement-offset . 8)))
(setq c-default-style "js")
(add-hook 'c-mode-hook '(lambda () (c++-mode)))

;;(c-set-offset 'innamespace 0)
;;(setq c-basic-offset 4)
