;;; +eshell.el -*- lexical-binding: t; -*-

;; Like most shells, Eshell supports both login and profile/rc shell scripts.
;; The full filepaths for both are stored in the variables `eshell-login-script'
;; and `eshell-rc-script', but by default the files login and profile are stored
;; in `~/.eshell/'.

;; It bears mention that the comment syntax is #.

;; (map!
;;   :map eshell-mode-map

;;   :localleader
;;   :n "s" #'+eshell/switch-to)


  ;; (:desc "window"
  ;;  :prefix "w"
  ;;   :n "s" #'+eshell/split-below
  ;;   :n "v" #'+eshell/split-right
  ;;   :n "x" #'+eshell/kill-and-close

  ;;   :n "h" #'windmove-left
  ;;   :n "j" #'windmove-down
  ;;   :n "k" #'windmove-up
  ;;   :n "l" #'windmove-right))
