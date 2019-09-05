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

(hercules-def
 :toggle-funs #'ranger-hydra-show
 :keymap 'ranger-mode-map
 :transient t)

(map!
  :localleader
  :map ranger-mode-map
  "," #'ranger-hydra-show)

(hercules-def
 :show-funs #'org-mode-hydra-show
 :keymap 'org-mode-map
 :transient t)

(map!
  :localleader
  :map org-mode-map
  "," #'org-mode-hydra-show)

(hercules-def
 :show-funs #'markdown-mode-hydra-show
 :keymap 'markdown-mode-map
 :transient t)

(map!
  :localleader
  :map markdown-mode-map
  "," #'markdown-mode-hydra-show)


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


;; TODO - not enabled yet
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
