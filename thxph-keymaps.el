;;; ~/.doom.d/thxph-keymaps.el -*- lexical-binding: t; -*-

;; Remap C-t to jump back instead of creating new workspace
(map! :n "C-t" #'better-jumper-jump-backward)
