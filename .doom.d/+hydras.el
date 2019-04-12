;;; ~/.doom.d/+hydras.el -*- lexical-binding: t; -*-

;; All based on https://github.com/abo-abo/hydra/wiki
;; Find more spacemacs ones here: https://github.com/syl20bnr/spacemacs/search?p=1&q=define-transient-state&unscoped_q=define-transient-state
;;
;; Colours
;; |----------+-----------+-----------------------+-----------------|
;; | Body     | Head      | Executing NON-HEADS   | Executing HEADS |
;; | Color    | Inherited |                       |                 |
;; |          | Color     |                       |                 |
;; |----------+-----------+-----------------------+-----------------|
;; | amaranth | red       | Disallow and Continue | Continue        |
;; | teal     | blue      | Disallow and Continue | Quit            |
;; | pink     | red       | Allow and Continue    | Continue        |
;; | red      | red       | Allow and Quit        | Continue        |
;; | blue     | blue      | Allow and Quit        | Quit            |
;; |----------+-----------+-----------------------+-----------------|
;;
;; Ideas - Org-mode hydra
;;   - create table
;;   - narrow/widen
;;   - attach
;;   - archive using C-c C-x A
;;   - schedule/deadline
;;   - insert link via org-cliplink
;;   - pretty-copy via ox-clip-formatted-copy
;;   - todo status
;;   - insert structured templates
;;   - insert date+time using calendar
;;   - insert link


;; Dired
(defhydra hydra-dired (:hint nil :color pink)
  "
_+_ mkdir          _v_iew           _m_ark             _(_ details        _i_nsert-subdir    wdired
_C_opy             _O_ view other   _U_nmark all       _)_ omit-mode      _$_ hide-subdir    C-x C-q : edit
_D_elete           _o_pen other     _u_nmark           _l_ redisplay      _w_ kill-subdir    C-c C-c : commit
_R_ename           _M_ chmod        _t_oggle           _g_ revert buf     _e_ ediff          C-c ESC : abort
_Y_ rel symlink    _G_ chgrp        _E_xtension mark   _s_ort             _=_ pdiff
_S_ymlink          ^ ^              _F_ind marked      _._ toggle hydra   \\ flyspell
_r_sync            ^ ^              ^ ^                ^ ^                _?_ summary
_z_ compress-file  _A_ find regexp
_Z_ compress       _Q_ repl regexp

T - tag prefix
"
  ("\\" dired-do-ispell)
  ("(" dired-hide-details-mode)
  (")" dired-omit-mode)
  ("+" dired-create-directory)
  ("=" diredp-ediff)         ;; smart diff
  ("?" dired-summary)
  ("$" diredp-hide-subdir-nomove)
  ("A" dired-do-find-regexp)
  ("C" dired-do-copy)        ;; Copy all marked files
  ("D" dired-do-delete)
  ("E" dired-mark-extension)
  ("e" dired-ediff-files)
  ("F" dired-do-find-marked-files)
  ("G" dired-do-chgrp)
  ("g" revert-buffer)        ;; read all directories again (refresh)
  ("i" dired-maybe-insert-subdir)
  ("l" dired-do-redisplay)   ;; relist the marked or singel directory
  ("M" dired-do-chmod)
  ("m" dired-mark)
  ("O" dired-display-file)
  ("o" dired-find-file-other-window)
  ("Q" dired-do-find-regexp-and-replace)
  ("R" dired-do-rename)
  ("r" dired-do-rsynch)
  ("S" dired-do-symlink)
  ("s" dired-sort-toggle-or-edit)
  ("t" dired-toggle-marks)
  ("U" dired-unmark-all-marks)
  ("u" dired-unmark)
  ("v" dired-view-file)      ;; q to exit, s to search, = gets line #
  ("w" dired-kill-subdir)
  ("Y" dired-do-relsymlink)
  ("z" diredp-compress-this-file)
  ("Z" dired-do-compress)
  ("q" nil)
  ("." nil :color blue))

;; (define-key dired-mode-map "." 'hydra-dired/body)
;;
(map!
  :localleader
  ;;:map dired-mode-map ranger-mode-map
  :map ranger-mode-map
  "," #'hydra-dired/body)

;; Hydra for org agenda (graciously taken from Spacemacs)
(defhydra hydra-org-agenda (:pre (setq which-key-inhibit t)
                                 :post (setq which-key-inhibit nil)
                                 :hint none)
  "
Org agenda (_q_uit)

^Clock^      ^Visit entry^              ^Date^             ^Other^
^-----^----  ^-----------^------------  ^----^-----------  ^-----^---------
_ci_ in      _SPC_ in other window      _ds_ schedule      _gr_ reload
_co_ out     _TAB_ & go to location     _dd_ set deadline  _._  go to today
_cq_ cancel  _RET_ & del other windows  _dt_ timestamp     _gd_ go to date
_cj_ jump    _o_   link                 _+_  do later      ^^
^^           ^^                         _-_  do earlier    ^^
^^           ^^                         ^^                 ^^
^View^          ^Filter^                 ^Headline^         ^Toggle mode^
^----^--------  ^------^---------------  ^--------^-------  ^-----------^----
_vd_ day        _ft_ by tag              _ht_ set status    _tf_ follow
_vw_ week       _fr_ refine by tag       _hk_ kill          _tl_ log
_vt_ fortnight  _fc_ by category         _hr_ refile        _ta_ archive trees
_vm_ month      _fh_ by top headline     _hA_ archive       _tA_ archive files
_vy_ year       _fx_ by regexp           _h:_ set tags      _tr_ clock report
_vn_ next span  _fd_ delete all filters  _hp_ set priority  _td_ diaries
_vp_ prev span  ^^                       ^^                 ^^
_vr_ reset      ^^                       ^^                 ^^
^^              ^^                       ^^                 ^^
"
  ;; Entry
  ("hA" org-agenda-archive-default)
  ("hk" org-agenda-kill)
  ("hp" org-agenda-priority)
  ("hr" org-agenda-refile)
  ("h:" org-agenda-set-tags)
  ("ht" org-agenda-todo)
  ;; Visit entry
  ("o"   link-hint-open-link :exit t)
  ("<tab>" org-agenda-goto :exit t)
  ("TAB" org-agenda-goto :exit t)
  ("SPC" org-agenda-show-and-scroll-up)
  ("RET" org-agenda-switch-to :exit t)
  ;; Date
  ("dt" org-agenda-date-prompt)
  ("dd" org-agenda-deadline)
  ("+" org-agenda-do-date-later)
  ("-" org-agenda-do-date-earlier)
  ("ds" org-agenda-schedule)
  ;; View
  ("vd" org-agenda-day-view)
  ("vw" org-agenda-week-view)
  ("vt" org-agenda-fortnight-view)
  ("vm" org-agenda-month-view)
  ("vy" org-agenda-year-view)
  ("vn" org-agenda-later)
  ("vp" org-agenda-earlier)
  ("vr" org-agenda-reset-view)
  ;; Toggle mode
  ("ta" org-agenda-archives-mode)
  ("tA" (org-agenda-archives-mode 'files))
  ("tr" org-agenda-clockreport-mode)
  ("tf" org-agenda-follow-mode)
  ("tl" org-agenda-log-mode)
  ("td" org-agenda-toggle-diary)
  ;; Filter
  ("fc" org-agenda-filter-by-category)
  ("fx" org-agenda-filter-by-regexp)
  ("ft" org-agenda-filter-by-tag)
  ("fr" org-agenda-filter-by-tag-refine)
  ("fh" org-agenda-filter-by-top-headline)
  ("fd" org-agenda-filter-remove-all)
  ;; Clock
  ("cq" org-agenda-clock-cancel)
  ("cj" org-agenda-clock-goto :exit t)
  ("ci" org-agenda-clock-in :exit t)
  ("co" org-agenda-clock-out)
  ;; Other
  ("q" nil :exit t)
  ("gd" org-agenda-goto-date)
  ("." org-agenda-goto-today)
  ("gr" org-agenda-redo))

(map!
  :localleader
  :map org-mode-map
  "," #'hydra-org-agenda/body)


(defhydra hydra-lsp (:exit t :hint nil)

  "
 Buffer^^               Server^^                   Symbol
-------------------------------------------------------------------------------------
 [_f_] format           [_M-r_] restart            [_d_] declaration  [_i_] implementation  [_o_] documentation
 [_m_] imenu            [_S_]   shutdown           [_D_] definition   [_t_] type            [_r_] rename
 [_x_] execute action   [_M-s_] describe session   [_R_] references   [_s_] signature"
  ("d" lsp-find-declaration)
  ("D" lsp-ui-peek-find-definitions)
  ("R" lsp-ui-peek-find-references)
  ("i" lsp-ui-peek-find-implementation)
  ("t" lsp-find-type-definition)
  ("s" lsp-signature-help)
  ("o" lsp-describe-thing-at-point)
  ("r" lsp-rename)

  ("f" lsp-format-buffer)
  ("m" lsp-ui-imenu)
  ("x" lsp-execute-code-action)

  ("M-s" lsp-describe-session)
  ("M-r" lsp-restart-workspace)
  ("S" lsp-shutdown-workspace))


;; "
;; Formatting        C-c C-s    _s_: bold          _e_: italic     _b_: blockquote   _p_: pre-formatted    _c_: code
;; Headings          C-c C-t    _h_: automatic     _1_: h1         _2_: h2           _3_: h3               _4_: h4
;; Lists             C-c C-x    _m_: insert item
;; Demote/Promote    C-c C-x    _l_: promote       _r_: demote     _u_: move up      _d_: move down
;; Links, footnotes  C-c C-a    _L_: link          _U_: uri        _F_: footnote     _W_: wiki-link
;; "

(defhydra hydra-markdown-mode (:color blue)
  "Markdown editing"

  ("s" markdown-insert-bold "Bold" :column "Formatting")
  ("e" markdown-insert-italic "Italic")
  ("b" markdown-insert-blockquote "Blockquote" :color blue)
  ("p" markdown-insert-pre "Pre-formatted" :color blue)
  ("c" markdown-insert-gfm-code-block "Code block")
  ("C" markdown-insert-code "Inline code")

  ("h" markdown-insert-header-dwim "Automatic heading" :column "Headings")
  ("1" markdown-insert-header-atx-1 "h1")
  ("2" markdown-insert-header-atx-2 "h2")
  ("3" markdown-insert-header-atx-3 "h3")
  ("4" markdown-insert-header-atx-4 "h4")

  ("m" markdown-insert-list-item "Insert item" :column "Lists")

  ("l" markdown-promote "Promote" :column "Demote/Promote")
  ("r" markdown-demote "Demote")
  ("d" markdown-move-down "Move up")
  ("u" markdown-move-up "Move down")

  ("L" markdown-insert-link "Link" :color blue :column "Links/Footnotes")
  ("U" markdown-insert-uri "URI" :color blue)
  ("F" markdown-insert-footnote "Foortnote" :color blue)
  ("W" markdown-insert-wiki-link "Wiki-link" :color blue))

(map!
  :localleader
  :map markdown-mode-map
  "," #'hydra-markdown-mode/body)


(defhydra hydra-para (:color blue)
    "
    P.A.R.A. control panel (_q_uit)
    ^Notes^             ^Storage^
    ^-----^-------------^--^---------
      _t_ Tasks          _s_ Dropbox
      _p_ Projects       _S_ Dropbox, dired
      _a_ Areas          _l_ Local
      _r_ Resources      _L_ Local, dired
      _A_ Archives
    "

    ("t" (find-file "~/Dropbox/org/tasks.org"))
    ("p" (find-file "~/Dropbox/org/1 Projects.org"))
    ("a" (find-file "~/Dropbox/org/2 Areas.org"))
    ("r" (find-file "~/Dropbox/org/3 Resources.org"))
    ("A" (find-file "~/Dropbox/org/4 Archives.org"))

    ("s" (+macos/reveal-in-finder "~/Dropbox"))
    ("S" (ranger "~/Documents"))
    ("l" (+macos/reveal-in-finder "~/Documents"))
    ("L" (ranger "~/Documents"))

    ("q" nil))

(map! :leader
  (:desc "P.A.R.A." :n "P" #'hydra-para/body))

;; Git-timemachine
(defhydra hydra-git-timemachine
    (:color red
     :body-pre (unless (bound-and-true-p git-timemachine-mode)
                 (call-interactively 'git-timemachine))
     :before-exit (when (bound-and-true-p git-timemachine-mode)
                     (git-timemachine-quit))
     :foreign-keys run)
    "
    Git Timemachine Transient State

    [_p_/_N_] previous [_n_] next [_c_] current [_F_] fuzzy find [_Y_] copy hash [_q_] quit
    "

    ("c" (git-timemachine-show-current-revision))
    ;("g" (git-timemachine-show-nth-revision))
    ("p" (git-timemachine-show-previous-revision))
    ("n" (git-timemachine-show-next-revision))
    ("N" (git-timemachine-show-previous-revision))
    ("Y" (git-timemachine-kill-revision))
    ("F" (git-timemachine-show-revision-fuzzy))
    ("q" nil :exit t))

(map! :leader
  (:prefix "g"
    (:desc "Git time hydra" :n "T" #'hydra-git-timemachine/body)))


(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

(defhydra hydra-window ()
   "
Movement^^       ^Split^         ^Resize^
-----------------------------------------------
_h_ ?            _v_ertical       _C-h_ X?
_j_ ?            _x_ horizontal   _C-j_ X?
_k_ ?            _z_ undo         _C-k_ X?
_l_ ?            _Z_ reset        _C-l_ X?
_F_ollow         _D_lt Other      _i_ enlargen
_SPC_ cancel     _o_nly this      _I_ zoom
^^               _d_elete         _b_alance
"
   ("h" +evil/window-move-left)
   ("j" +evil/window-move-down)
   ("k" +evil/window-move-up)
   ("l" +evil/window-move-right)

   ;; ("H" evil-window-decrease-width)
   ;; ("J" evil-window-decrease-height)
   ;; ("K" evil-window-increase-height)
   ;; ("L" evil-window-increase-width)

   ("C-h" hydra-move-splitter-left)
   ("C-j" hydra-move-splitter-down)
   ("C-k" hydra-move-splitter-up)
   ("C-l" hydra-move-splitter-right)

   ("b" balance-windows)
   ("F" follow-mode)
   ;; ("b" helm-mini)
   ;; ("f" helm-find-files)
   ;; ("a" (lambda ()
   ;;        (interactive)
   ;;        (ace-window 1)
   ;;        (add-hook 'ace-window-end-once-hook
   ;;                  'hydra-window/body)))
   ;; ("s" (lambda ()
   ;;        (interactive)
   ;;        (ace-window 4)
   ;;        (add-hook 'ace-window-end-once-hook
   ;;                  'hydra-window/body)))
   ;; ("S" save-buffer)
   ("d" delete-window)

   ("v" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right)))

   ("x" (lambda ()
          (interactive)
          (split-window-below)
          (windmove-down)))

   ("D" (lambda ()
          (interactive)
          (ace-window 16)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)))

   ("o" delete-other-windows)
   ("i" doom/window-enlargen :color blue)
   ("I" doom/window-zoom :color blue)
   ("z" (progn
          (winner-undo)
          (setq this-command 'winner-undo)))

   ("Z" winner-redo)
   ("SPC" nil))

(map! :leader
  (:desc "Window management hydra" :n "W" #'hydra-window/body))
