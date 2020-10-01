;;; ~/.doom.d/thxph-magit.el -*- lexical-binding: t; -*-

(after! magit
  (setq magit-repository-directories
        '(("~/.doom.d"  . 0)
          ("~/src/" . 2))))
