;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-localleader-key ",")
(setq doom-theme 'doom-molokai)
(setq doom-font (font-spec :family "Fira Code" :size 16))

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; Make gsSPC work in all windows
(setq avy-all-windows t)
(setq auto-window-vscroll nil)

(setq lisp-indent-offset 2)
(setq-default evil-shift-width 2 ;; I normally use 2wide for my projects.
              tab-width 2)

(map!
  :i "M-3" (lambda! (insert "#"))
  :n "j" #'evil-next-visual-line
  :n "k" #'evil-previous-visual-line

  ;; Add easy way to find
  (:map override
   "M-f" #'swiper-helm)  ;; can also be called via SPC / b

  (:after helm-files
   :map (helm-find-files-map helm-read-file-map)
   "C-l"      #'helm-execute-persistent-action
   "C-h"      #'helm-find-files-up-one-level)

  :leader
  (:desc "toggle" :prefix "t"
   :desc "Line wrap" :n "l" #'toggle-truncate-lines)

  (:desc "Kill ring" :n "K" #'helm-show-kill-ring)

  (:prefix ("w" . "windows")
   :desc "Other window" "w"  #'other-window)

  (:prefix ("a" . "apps")
   :desc "Prodigy" "p"  #'prodigy
   :desc "Deer"    "r"  #'deer
   :desc "Ranger"  "R"  #'ranger))

(after! evil-escape
  (setq evil-escape-key-sequence "ii"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modules
(load! "+docker")
(load! "+ein")
(load! "+eshell")
(load! "+fixes")
(load! "+hydras")
(load! "+lsp")
(load! "+org")
(load! "+prodigy")
(load! "+ranger")
(load! "+shell")
(load! "+tramp")

(when IS-WINDOWS
  (load! "+work") ;; All work-related, Windows-specific stuff
  ;; Don't use Emacs' native indexing on Win - very slow
  (setq projectile-indexing-method 'alien))
