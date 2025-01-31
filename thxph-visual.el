;;; ~/.doom.d/thxph-visual.el -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq frame-title-format
      '("%b"
        (:eval
         (let ((project-name (projectile-project-name)))
           (unless (string= "-" project-name)
             (format " in [%s]" project-name))))
        " – %p"))

(setq doom-font (font-spec :family "Fira Code" :size 15))
(setq display-line-numbers-type t)
(setq-default line-spacing .37)

;(add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-1 80)))

(setq doom-theme 'doom-one)
(doom-themes-visual-bell-config)
(setq doom-themes-treemacs-theme "doom-colors")
(doom-themes-treemacs-config)
(doom-themes-org-config)

(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-indent-info t)

;; (setq-default nyan-animate-nyancat t
;;               nyan-wavy-trail t
;;               nyan-bar-length 20)
;; (nyan-mode t)

;; Adapted from http://www.modernemacs.com/post/pretty-magit/

(defmacro pretty-magit (WORD ICON PROPS &optional NO-PROMPT?)
  "Replace sanitized WORD with ICON, PROPS and by default add to prompts."
  `(prog1
     (add-to-list 'pretty-magit-alist
                  (list (rx bow (group ,WORD (eval (if ,NO-PROMPT? "" ":"))))
                        ,ICON ',PROPS))
     (unless ,NO-PROMPT?
       (add-to-list 'pretty-magit-prompt (concat ,WORD ": ")))))

(setq pretty-magit-alist nil)
(setq pretty-magit-prompt nil)
(pretty-magit "Feature"  ? (:foreground "slate gray" :height 1.2))
(pretty-magit "Add"      ? (:foreground "#375E97" :height 1.2))
(pretty-magit "Fix"      ? (:foreground "#FB6542" :height 1.2))
(pretty-magit "Refactor" ? (:foreground "#FFBB00" :height 1.2))
(pretty-magit "Docs"     ? (:foreground "#3F681C" :height 1.2))
;(pretty-magit "master"   ? (:height 1.2) t)


(defun add-magit-faces ()
  "Add face properties and compose symbols for buffer from pretty-magit."
  (interactive)
  (with-silent-modifications
    (--each pretty-magit-alist
      (-let (((rgx icon props) it))
        (save-excursion
          (goto-char (point-min))
          (while (search-forward-regexp rgx nil t)
            (compose-region
             (match-beginning 1) (match-end 1) icon)
            (when props
              (add-face-text-property
               (match-beginning 1) (match-end 1) props))))))))

(advice-add 'magit-status :after 'add-magit-faces)
(advice-add 'magit-refresh-buffer :after 'add-magit-faces)
