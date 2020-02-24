;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Thanh X. Pham"
      user-mail-address "thanh.x.ph@gmail.com")

(load! "thxph-visual")
(load! "thxph-fira")
(load! "thxph-org")
(load! "thxph-keymaps")
(load! "thxph-hydras")
;(load! "font-lock+")

(add-to-list '+format-on-save-enabled-modes 'go-mode t)
(add-hook! 'go-mode-hook
  (add-hook 'before-save-hook #'lsp-format-buffer nil 'local)
  (add-hook 'before-save-hook #'lsp-organize-imports nil 'local))
