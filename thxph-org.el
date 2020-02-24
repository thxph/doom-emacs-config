;;; ~/.doom.d/thxph-org.el -*- lexical-binding: t; -*-

(setq org-directory "~/org/")
;(use-package! org-attach)
;(use-package! org-download)
(after! org
  (setq org-ellipsis "⤵")
  "✿" "❀" "✸" "●" "◉" "○" ; ♥ ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢  ◆ ◖ ▶
  (setq org-bullets-bullet-list '("✿" "❀" "✸" "●" "◉" "○"))
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"
           "PROJ(p)"
           "STRT(s!)"
           "WAIT(w@)"
           "|"
           "DONE(d!)"
           "NOOP(c@)")
          (sequence
           "[ ](T)"   ; A task that needs doing
           "[-](S)"   ; Task is in progress
           "[?](W)"   ; Task is being held up or paused
           "|"
           "[✓](D)"
           "[X](C)")) ; Task was completed
        org-todo-keyword-faces
        '(("[-]"  . +org-todo-active)
          ("STRT" . +org-todo-active)
          ("[?]"  . +org-todo-onhold)
          ("WAIT" . +org-todo-onhold)
          ("PROJ" . +org-todo-project)))
  (setq org-log-done 'time)
  )
