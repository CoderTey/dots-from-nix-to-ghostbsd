;; ======================================================
;; Graydon Hoare Inspired Emacs Config - Pgtk & vterm Friendly
;; ======================================================

;; -----------------------
;; Package Management
;; -----------------------
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; -----------------------
;; Appearance / Theme
;; -----------------------
(use-package nord-theme
  :ensure t
  :config
  (load-theme 'nord t))



;; -----------------------
;; Basic Editing Enhancements
;; -----------------------
(global-display-line-numbers-mode t)
(global-hl-line-mode 1)
(xterm-mouse-mode 1)
(setq scroll-step 1
      scroll-conservatively 10000)
(fset 'yes-or-no-p 'y-or-n-p)
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; -----------------------
;; Copying / Clipboard
;; -----------------------
;; In Pgtk Emacs + vterm, M-w works directly for system clipboard
(global-set-key (kbd "C-c C-y") 'kill-ring-save)

;; -----------------------
;; vterm setup
;; -----------------------
(use-package vterm
  :ensure t
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000))

;; -----------------------
;; Rust / LSP Setup
;; -----------------------
(use-package rust-mode
  :hook (rust-mode . lsp)
  :config
  (setq rust-format-on-save t))

(electric-pair-mode 1)

(use-package lsp-mode
  :commands lsp
  :init
  (setq lsp-keymap-prefix "C-c l"))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))

;; -----------------------
;; Miscellaneous
;; -----------------------
(global-font-lock-mode 4)
(show-paren-mode 1)

(provide 'init)
;;; init.el ends here
