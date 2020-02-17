;;; ~/.doom.d/thxph-org.el -*- lexical-binding: t; -*-

(setq org-directory "~/org/")

(after! org
  "✿" "❀" "✸" "●" "◉" "○" ; ♥ ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢  ◆ ◖ ▶
  (setq org-bullets-bullet-list '("✿" "❀" "✸" "●" "◉" "○"))
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"  ; A task that needs doing & is ready to do
           "PROJ(p)"  ; An ongoing project that cannot be completed in one step
           "STRT(s!)"  ; A task that is in progress
           "WAIT(w@)"  ; Something is holding up this task; or it is paused
           "|"
           "DONE(d!)"  ; Task successfully completed
           "KILL(k@)") ; Task was cancelled, aborted or is no longer applicable
          (sequence
           "[ ](T)"   ; A task that needs doing
           "[-](S)"   ; Task is in progress
           "[?](W)"   ; Task is being held up or paused
           "|"
           "[✓](D)"
           "[X](K)")) ; Task was completed
        org-todo-keyword-faces
        '(("[-]"  . +org-todo-active)
          ("STRT" . +org-todo-active)
          ("[?]"  . +org-todo-onhold)
          ("WAIT" . +org-todo-onhold)
          ("PROJ" . +org-todo-project)))

  (setq org-log-done 'time)

  ;; (require 'org-id)
  ;; (require 'org-archive)
  ;; (require 'org-attach)
  ;; (require 'org-refile)
  )
