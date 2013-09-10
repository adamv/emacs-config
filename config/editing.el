;;; Editing

;; make typing overwrite text selection
(delete-selection-mode 1) ; this turns on transient-mark-mode automatically

;;; Whitepace
;; auto-insert final newlines in all files
;; (setq require-final-newline t)

;; highlight trailing whitespace
(setq-default show-trailing-whitespace t)

;; Indents
;; 4 space indents
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; File types
(add-to-list 'auto-mode-alist '("/zshrc$" . sh-mode))

;; Editing - C
(c-set-offset 'innamespace 0)
(setq c-basic-offset 4)
