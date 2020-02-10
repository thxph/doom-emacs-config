;;; ~/.doom.d/thxph-visual.el -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq doom-font (font-spec :family "Fira Code" :size 15))
(setq display-line-numbers-type t)
(setq-default line-spacing .37)

(setq doom-theme 'doom-material)
(doom-themes-visual-bell-config)
(setq doom-themes-treemacs-theme "doom-colors")
(doom-themes-treemacs-config)
(doom-themes-org-config)

(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-indent-info t)

(setq-default nyan-animate-nyancat t
              nyan-wavy-trail t
              nyan-bar-length 20)
(nyan-mode t)
