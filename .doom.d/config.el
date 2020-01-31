;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-localleader-key ",")
(setq doom-theme 'doom-molokai)
(setq doom-font (font-spec :family "Essential PragmataPro" :size 16))

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; Fix PATH
(add-to-list 'exec-path "/usr/local/bin")

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

  (:prefix "w"
   :desc "Other window" "w"  #'other-window)

  (:prefix "a"
   :desc "Prodigy" "p"  #'prodigy
   :desc "Deer"    "r"  #'deer
   :desc "Ranger"  "R"  #'ranger))

(after! evil-escape
  (setq evil-escape-key-sequence "ii"))

;; Fix exit sequence for `emacsclient' for Joplin external editing
(add-hook 'server-switch-hook
  (lambda ()
    (when (current-local-map)
      (use-local-map (copy-keymap (current-local-map))))
    (when server-buffer-clients
      (local-set-key (kbd "C-c k") 'server-edit))))

;; no need for hard-wrapping in markdown
(remove-hook 'markdown-mode-hook #'auto-fill-mode)

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
(load! "+cheatsheet")
(load! "+clojure")

(when IS-WINDOWS
  (load! "+work") ;; All work-related, Windows-specific stuff
  ;; Don't use Emacs' native indexing on Win - very slow
  (setq projectile-indexing-method 'alien))
