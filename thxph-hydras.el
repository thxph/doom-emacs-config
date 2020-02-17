;;; ~/.doom.d/thxph-hydras.el -*- lexical-binding: t; -*-

(global-unset-key (kbd "<f10>"))

(defhydra hydra-dired-main (:hint nil :color pink)
  "
+----------------^^^^^^--+^^----------------+--^^^^^^-----------------------+-^^^^--------------+
|      ^^^^^^         Action    ^^          |        ^^^View/Mark^^^        |      ^^Nav^^      |
+-------------^^-^^^^----+---^^-------------+-^^^^^^------------------------+-^^-------^^-------+
| _+_ mkdir ^^^^         | _M_  chmod       | _go_    view ^^^^             | _(_  details  ^^  |
| _C_ copy ^^^^          | _O_  chown       | _M-RET_ disp ^^^^             | _g?_ summary  ^^  |
| _D_ rm ^^^^            | _gG_ chgrp       | _gf_    find _C-m_ _RET_      | _-_  up dir  ^^   |
| _R_ rename ^^^^        | _A_  find regexp | _gO_    find other _S-RET_ ^^ | _I_  subdir ^^    |
| _T_ touch ^^^^         | _Q_  repl regexp | _m_     mark ^^^^             | _r_  redisplay ^^ |
| _S_ symlink ^^^^       | _gr_ revert buf  | _u_     unmark ^^^^           | _o_  sort^^       |
| _H_ harklink ^^^^      | _a_  alternate   | _t_     toggle marks ^^^^     | _gy_ show type ^^ |
| _X_ _!_ cmd _&_ async  | _=_  diff        | _U_     unmark all ^^^^       | _)_  omit mode  ^^|
| _Z_ compress _c_ dst^^ | _i_  toggle RO   | _M-C-?_ unmark files ^^^^     | _gj_ _>_ dir line |
| _B_ _L_ elisp ^^       | _Y_  copy name   | _M-{_ _M-}_ mark p/n ^^       | _P_  print  ^^    |
+----------------^^^^^^--+^^----------------+--^^^^^^-----------------------+-^^^^--------------+
 _<f10>_ toggle hydra. _*_ mark. _%_ regexp
"
  ("+" dired-create-directory)
  ("C" dired-do-copy)
  ("D" dired-do-delete)
  ("R" dired-do-rename)
  ("T" dired-do-touch)
  ("S" dired-do-symlink)
  ("H" dired-do-hardlink)
  ("X" dired-do-shell-command)
  ("!" dired-do-shell-command)
  ("&" dired-do-async-shell-command)
  ("Z" dired-do-compress)
  ("c" dired-do-compress-to)
  ("B" dired-do-byte-compile)
  ("L" dired-do-load)

  ("M" dired-do-chmod)
  ("O" dired-do-chown)
  ("gG" dired-do-chgrp)
  ("A" dired-do-find-regexp)
  ("Q" dired-do-find-regexp-and-replace)
  ("gr" revert-buffer)
  ("a" dired-find-alternate-file)
  ("=" dired-diff)
  ("i" dired-toggle-read-only)
  ("Y" dired-copy-filename-as-kill)

  ("go" dired-view-file)
  ("M-RET" dired-display-file)
  ("gf" dired-find-file)
  ("C-m" dired-find-file)
  ("RET" dired-find-file)
  ("S-RET" dired-find-file-other-window)
  ("gO" dired-find-file-other-window)


  ("m" dired-mark)
  ("u" dired-unmark)
  ("t" dired-toggle-marks)
  ("U" dired-unmark-all-marks)
  ("M-C-?" dired-unmark-all-files)
  ("M-{" dired-prev-marked-file)
  ("M-}" dired-next-marked-file)

  ("d" dired-flag-file-deletion)
  ("x" dired-do-flagged-delete)
  ("." dired-clean-directory)
  ("#" dired-flag-auto-save-files)
  ("~" dired-flag-backup-files)


  ("M-C-d" dired-tree-down)
  ("M-C-u" dired-tree-up)
  ("M-C-n" dired-next-subdir)
  ("M-C-p" dired-prev-subdir)

  ("J" dired-goto-file)
  ("K" dired-do-kill-lines)

  ("W" browse-url-of-dired-file)
  ("gy" dired-show-file-type)
  ("q" quit-window)
  ("j" dired-next-line)
  (" " dired-next-line)
  ("k" dired-previous-line)
  ("r" dired-do-redisplay)
  ("P" dired-do-print)
  ("I" dired-maybe-insert-subdir)

  ("gj" dired-next-dirline)
  (">" dired-next-dirline)
  ("]]" dired-next-dirline)

  ("gk" dired-prev-dirline)
  ("[[" dired-prev-dirline)
  ("<" dired-prev-dirline)

  ("^" dired-up-directory)
  ("-" dired-up-directory)
  ("o" dired-sort-toggle-or-edit)
  ("g$" dired-hide-subdir)
  ("M-$" dired-hide-all)
  ("M-s a C-s"   dired-do-isearch)
  ("M-s a M-C-s" dired-do-isearch-regexp)
  ("M-s f C-s"   dired-isearch-filenames)
  ("M-s f M-C-s" dired-isearch-filenames-regexp)
  ("(" dired-hide-details-mode)
  (")" dired-omit-mode)
  ("g?" dired-summary)



  ("*" hydra-dired-mark/body :color blue)
  ("%" hydra-dired-regexp/body :color blue)
  ("<f10>" nil :color blue))

(map! :map dired-mode-map "<f10>" #'hydra-dired-main/body)

(defhydra hydra-dired-mark (:color teal :hint nil
                                   :after-exit (hydra-dired-main/body))
  "
 ^Mark^              | ^Unmark^            | ^Nav^
-^----^--------------+-^------^------------+-^---^-------
 _*_: mark exes      |  _m_: mark          |
 _/_: mark dirs      |  _u_: unmark        |
 _@_: mark symlinks  |  _t_: toggle        |
 _%_: mark regexp    |  _U_: unmark all    |
 _(_: mark sexp      |  _?_: unmark files  |
 _._: mark extension |  _!_: unmark all    | _C-n_: next
 _O_: mark omitted   | _DEL_: unmark back  | _C-p_: prev
 _s_: mark subdir    |  _c_: change mark   |  _b_: back
-^----^--------------+-^------^------------+-^---^-------
"
  ("*" dired-mark-executables)
  ("/" dired-mark-directories)
  ("@" dired-mark-symlinks)
  ("%" dired-mark-files-regexp)
  ("(" dired-mark-sexp)
  ("." dired-mark-extension)
  ("O" dired-mark-omitted)
  ("s" dired-mark-subdir-files)

  ("m" dired-mark)
  ("u" dired-unmark)
  ("t" dired-toggle-marks)
  ("U" dired-unmark-all-marks)
  ("?" dired-unmark-all-files)
  ("!" dired-unmark-all-marks)
  ("DEL" dired-unmark-backward)
  ("c" dired-change-marks)

  ("C-n" dired-next-marked-file)
  ("C-p" dired-prev-marked-file)

  ("b" hydra-dired-main/body :color blue)
  )

(defhydra hydra-dired-regexp (:color teal :hint nil
                                   :after-exit (hydra-dired-main/body))
  "
 ^Mark^              | ^Action^            | ^Nav^
-^----^--------------+-^------^------------+-^---^-------
_m_: files regexp   | _u_: rename upper    |
_g_: content regexp | _l_: rename lower    |
_d_: del regexp     | _r_: rename regexp   |
_&_: del garbage    | _C_: copy regexp     |
^^                  | _S_: symlink regexp  |
^^                  | _H_: hardlink regexp |
^^                  | _R_: rename regexp   | _b_: back
-^----^--------------+-^------^------------+-^---^-------
"
  ("m" dired-mark-files-regexp)
  ("g" dired-mark-files-containing-regexp)
  ("d" dired-flag-files-regexp)
  ("&" dired-flag-garbage-files)

  ("u" dired-upcase)
  ("l" dired-downcase)
  ("r" dired-do-rename-regexp)
  ("C" dired-do-copy-regexp)
  ("S" dired-do-symlink-regexp)
  ("H" dired-do-hardlink-regexp)
  ("R" dired-do-rename-regexp)

  ("b" hydra-dired-main/body :color blue)
  )


(map! :leader "SPC" #'+hydra/window-nav/body)
(map! :leader "W" #'+hydra/window-nav/body)
