;; Modes

; TextMate
(require 'textmate)
(textmate-mode)

(autoload 'acme-mode "acme-mode"
    "Major mode for editing Acme 6502 sources." t)

(add-to-list 'auto-mode-alist '(".acme$" . acme-mode))
(add-to-list 'auto-mode-alist '(".s65$" . acme-mode))
