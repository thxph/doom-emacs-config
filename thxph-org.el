;;; ~/.doom.d/thxph-org.el -*- lexical-binding: t; -*-

(setq org-directory "~/org/")
;(use-package! org-attach)
;(use-package! org-download)
(after! org
  ;(add-hook 'doom-load-theme-hook (lambda () (set-face-foreground 'org-ellipsis "#ee7570")))
  "✿" "❀" "✸" "●" "◉" "○" ; ♥ ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢  ◆ ◖ ▶
  (setq org-superstar-headline-bullets-list '("✿" "❀" "✸" "●" "◉" "○")
        org-ellipsis "⤵"
        org-lowest-priority 69
        org-default-priority 67
        org-priority-faces '((65 . error)
                             (66 . warning)
                             (67 . success)
                             (68 . "#4da5e1")
                             (69 . "#5b6268"))
        org-todo-keywords
        '((sequence
           "TODO(t)"
           "PROJ(p)"
           "STRT(s!)"
           "WAIT(w@)"
           "|"
           "DONE(d)"
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
          ("PROJ" . +org-todo-project))
        org-log-done 'time
        )
  (set-face-foreground 'org-ellipsis "#ee7570")
  )
