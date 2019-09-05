;;; ~/dotfiles/.doom.d/+cheatsheet.el -*- lexical-binding: t; -*-

(cheatsheet-add-group 'Common
                      '(:key "C-x C-c" :description "leave Emacs")
                      '(:key "C-x C-f" :description "find file"))

(map!
  :after cheatsheet

  :map cheatsheet-mode-map
  :n "q" #'kill-buffer-and-window

  :leader
  (:desc "help" :prefix "h"
   :desc "Cheatsheet" :n "c" #'cheatsheet-show))
