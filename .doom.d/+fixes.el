;;; ~/dotfiles/.doom.d/+fixes.el -*- lexical-binding: t; -*-

(defadvice projectile-project-root (around ignore-remote first activate)
  (unless (file-remote-p default-directory) ad-do-it))

(add-hook! 'server-switch-hook
  (setq backup-by-copying t))
