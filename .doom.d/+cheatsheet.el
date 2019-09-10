;;; ~/dotfiles/.doom.d/+cheatsheet.el -*- lexical-binding: t; -*-

(cheatsheet-add-group 'Common
                      '(:key "SPC K" :description "show kill ring"))

(cheatsheet-add-group 'Code
                      '(:key "SPC g T" :description "git time machine"))

(map!
  :after cheatsheet

  :map cheatsheet-mode-map
  :n "q" #'kill-buffer-and-window

  :leader
  (:desc "help" :prefix "h"
   :desc "Cheatsheet" :n "c" #'cheatsheet-show))

(set-popup-rule! "^\\*cheatsheet*" :side 'bottom :size 50 :slot 3)
