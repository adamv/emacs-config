;;; Packaging
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t))

;;; Additional load paths
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/vendor")

;; local development
(add-to-list 'load-path "~/source/acme-mode")

(load "ui")
(load "buffers")
(load "editing")
(load "modes")
(load "keys")
(load "themes")

;; Save customizations to custom.el, not init.el
;; http://www.gnu.org/s/libtool/manual/emacs/Saving-Customizations.html
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (load custom-file))

(setq frame-title-format
      (list '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; dirtree
;; Add dirtree and dependencies to load path
(add-to-list 'load-path "~/.emacs.d/vendor/dirtree")
(require 'dirtree)


;; Don't use images in tree mode
(custom-set-variables '(tree-widget-image-enable nil))
