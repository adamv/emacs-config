;;;
;;; acme-mode.el
;;;
;;; Additional work by Adam Vandenberg <flangy@gmail.com>
;;;
;;; History:
;;; Based on acme-mode.el by Alexander Lehmann <afwlehmann@googlemail.com>
;;; https://github.com/afwlehmann/acme-mode
;;;
;;; heavily based on acme-mode.el by abad in 2008 (abad.flt at gmail.com)
;;;         based on asm-mode.el by Eric Raymond
;;;

(defgroup acme nil
  "Mode for editing assembler code."
  :group 'languages)

(defvar acme-mode-syntax-table nil
  "Syntax table used while in Acme mode.")

(defvar acme-mode-abbrev-table nil
  "Abbrev table used while in Acme mode.")
(define-abbrev-table 'acme-mode-abbrev-table ())

(defvar acme-mode-map nil
  "Keymap for Acme mode.")

(if acme-mode-map
    nil
  (setq acme-mode-map (make-sparse-keymap))
  (define-key acme-mode-map ":"     'acme-colon)
  (define-key acme-mode-map "\C-c;" 'comment-region)
  (define-key acme-mode-map "\C-i"  'tab-to-tab-stop)
  (define-key acme-mode-map "\C-j"  'acme-newline)
  (define-key acme-mode-map "\C-m"  'acme-newline))

(defconst acme-font-lock-keywords
  '(
    ("\\(;+\\)\\(.*\\)$"
     (1 font-lock-comment-delimiter-face) (2 font-lock-comment-face))
    ;; (global label)?:? keyword
    ("^\\(\\(\\sw\\|\\s_\\|[\\.]*\\)+\\)\\>:?[ \t]*\\(\\sw+\\(\\.\\sw+\\)*\\)?"
     (1 font-lock-function-name-face) (3 font-lock-keyword-face nil t))
    ;; local label started from ".".
    ("^\\(\\.\\(\\sw\\|\\s_\\)+\\)\\>:"
     1 font-lock-function-name-face)
    ;; keywords
    ("\\s-+\\(lda\\|sta\\|ldx\\|stx\\|ldy\\|sty\\|and\\|ora\\|eor\\|bit\\|cmp\\|cpx\\|cpy\\|adc\\|sbc\\|asl\\|lsr\\|rol\\|ror\\|inc\\|dec\\|jmp\\|jsr\\|brk\\|rts\\|rti\\|php\\|plp\\|pha\\|pla\\|inx\\|dex\\|iny\\|dey\\|tax\\|txa\\|tay\\|tya\\|tsx\\|txs\\|sed\\|cld\\|sei\\|cli\\|sec\\|clc\\|clv\\|beq\\|bne\\|bmi\\|bpl\\|bcc\\|bcs\\|bvc\\|bvs\\|nop\\)\\s-+"
     1 font-lock-keyword-face)
    ;; implicit keywords
    (",[xy]" . font-lock-keyword-face)
    ;; built-in commands
    ("\\([#!]\\sw+\\|else\\|[{}]\\)"
     . font-lock-preprocessor-face)
    ;; macro definition
    ("!macro\\s-+\\(\\(\\sw\\|\\s_\\)+\\)"
     (1 font-lock-type-face))
    ;; macro application
    ("\\s-+\\(\\+\\sw+\\)\\s-+"
     (1 font-lock-keyword-face))
    ;; numeric constants
    ("\\b\\([$0-9][0-9a-fA-F]*\\)"
     . font-lock-constant-face))
  "Additional expressions to highlight in Assembler mode.")

(defun acme-mode ()
  "Major mode for editing typical assembler code.
Features a private abbrev table and the following bindings:

\\[acme-colon]\toutdent a preceding label, tab to next tab stop.
\\[tab-to-tab-stop]\ttab to next tab stop.
\\[acme-newline]\tnewline, then tab to next tab stop.

Turning on Acme mode runs the hook `acme-mode-hook' at the end of initialization.

Special commands:
\\{acme-mode-map}
"
  (interactive)
  (kill-all-local-variables)
  (setq mode-name "ACME Assembler")
  (setq major-mode 'acme-mode)
  (setq local-abbrev-table acme-mode-abbrev-table)
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults '(acme-font-lock-keywords))
  (make-local-variable 'acme-mode-syntax-table)
  (setq acme-mode-syntax-table (make-syntax-table))
  (set-syntax-table acme-mode-syntax-table)
  (setq tab-width 8)
  (use-local-map (nconc (make-sparse-keymap) acme-mode-map))
  (setq comment-start "; ")
  (setq comment-end "")
  (setq fill-prefix "\t")
  (run-hooks 'acme-mode-hook))

(defun acme-colon ()
  "Insert a colon; if it follows a label, delete the label's indentation."
  (interactive)
  (save-excursion
    (beginning-of-line)
    (if (looking-at "[ \t]+\\(\\sw\\|\\s_\\)+$")
        (delete-horizontal-space)))
  (insert ":")
  (tab-to-tab-stop))

(defun acme-newline ()
  "Insert linefeed plus fill-prefix, to bring us back to code-indent level."
  (interactive)
  (if (eolp) (delete-horizontal-space))
  (insert "\n")
  (tab-to-tab-stop))

(defun acme-line-matches (pattern &optional withcomment)
  (save-excursion
    (beginning-of-line)
    (looking-at pattern)))

(provide 'acme-mode)
