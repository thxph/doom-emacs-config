;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Thanh X. Pham"
      user-mail-address "thanh.x.ph@gmail.com")

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq doom-font (font-spec :family "Fira Code" :size 15))
(setq-default line-spacing .37)

(setq doom-theme 'doom-material)
(doom-themes-visual-bell-config)
(setq doom-themes-treemacs-theme "doom-colors")
(doom-themes-treemacs-config)
(doom-themes-org-config)

(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-indent-info t)

(setq org-directory "~/org/")

(setq display-line-numbers-type t)

;; Remap C-t to jump back instead of creating new workspace
(map! :n "C-t" #'better-jumper-jump-backward)
