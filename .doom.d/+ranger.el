;;; ~/dotfiles/.doom.d/+ranger.el -*- lexical-binding: t; -*-

(after! ranger
  ;; Override dired-mode so it uses deer
  (setq ranger-deer-show-details t))
