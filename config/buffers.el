; autosave to tmp
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

; no backups
(setq backup-inhibited t)

; don't confirm opening non-existant files/buffers
(setq confirm-nonexistent-file-or-buffer nil)
