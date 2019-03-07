;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-localleader-key ",")
(setq doom-theme 'doom-molokai)
;; Make gsSPC work in all windows
(setq avy-all-windows t)
;; Don't use Emacs' native indexing on Win - very slow
(setq projectile-indexing-method 'alien)
(setq auto-window-vscroll nil)

(setq lisp-indent-offset 2)
(setq-default evil-shift-width 2 ;; I normally use 2wide for my projects.
              tab-width 2)

(map!
  (:after helm-files
   :map (helm-find-files-map helm-read-file-map)
   "C-l"      #'helm-execute-persistent-action
   "C-h"      #'helm-find-files-up-one-level)

  ;; FIXME: doesn't work
  ;; Add easy way to find
  (:map override
   "M-f" #'swiper-helm)  ;; can also be called via SPC / b

  (:when (featurep! :feature evil)
   :n "j" #'evil-next-visual-line
   :n "k" #'evil-previous-visual-line)

  (:map comint-mode-map
   "C-k"      #'comint-previous-input
   "C-j"      #'comint-next-input
   "M-k"      #'comint-previous-prompt
   "M-j"      #'comint-next-prompt
   "C-l"      #'helm-comint-input-ring)

   ;; FIXME: probably better done by using evil-collection-prodigy better
   ;; https://github.com/emacs-evil/evil-collection/blob/master/evil-collection-prodigy.el
  (:after prodigy
   (:map prodigy-mode-map
    "q"  'quit-window

    "j"  'prodigy-next
    "k"  'prodigy-prev
    "gg" 'prodigy-first
    "G"  'prodigy-last

    "Jm" 'prodigy-jump-magit
    "Jd" 'prodigy-jump-dired))

   ;; LEADER-based shortcuts
  :leader
  (:desc "toggle" :prefix "t"
   :desc "Line wrap" :n "l" #'toggle-truncate-lines)

  (:prefix ("a" . "apps")
   :desc "Prodigy" "p"  #'prodigy
   :desc "Deer"    "r"  #'deer
   :desc "Ranger"  "R"  #'ranger))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package config
(after! ein
  ;; Don't slice images into rows; easier to navigate around images
  (setq ein:slice-image nil))

(map!
  (:after ein
   (:map ein:notebook-mode-map
    :ni [C-return]     #'ein:worksheet-execute-cell
    :ni [S-return]     #'ein:worksheet-execute-cell-and-goto-next)

   :localleader
   (:map ein:notebook-mode-map "," #'+ein-hydra/body)))

(after! evil-escape
  (setq evil-escape-key-sequence "ii"))

;; FIXME: need to add :after (ox-clip shx)
(map! 
  :localleader
  :map org-mode-map
  "C" #'ox-clip-formatted-copy
  "p" #'org-cliplink)

;; FIXME doesn't necessarily work on macos
(after! shx
  (shx-global-mode +1))  ; toggle shx-mode on globally

(set-popup-rule! "^\\*shell.*" :side 'bottom :size 40 :slot 3 :select nil :quit nil :modeline t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mac-specific config below
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when IS-MAC
  (setq doom-font (font-spec :family "Fira Code" :size 16))

  (global-set-key (kbd "a-3") '(lambda () (interactive) (insert "#")))

  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Prodigy services
  ;; very interesting use of :ready-message and custom dirs
  ;; https://github.com/wzb56/.emacs.d/blob/master/init/init-prodigy.el
  ;; and https://writequit.org/org/settings.html#sec-1-28
  ;;
  ;; might be useful for remapping keybindings
  ;; https://github.com/emacs-evil/evil-collection/blob/master/evil-collection-prodigy.el

  (after! prodigy
    (prodigy-define-service
      :name "(venv) Jupyter lab"
      :command "jupyter"
      :args '("lab")
      :port 8888
      :cwd "...dir..."
      :tags '(work)
      :stop-signal 'sigkill
      :kill-process-buffer-on-stop t
      :ready-message "Use Control-C to stop this server"
      :init (lambda () (pyvenv-activate "/path/to/venv"))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Org config

  (setq org-directory "~/Dropbox/org")
  (setq org-archive-location (concat org-directory "/archive.org::* Projects"))
  ; http://doc.endlessparentheses.com/Var/org-archive-location.html
  (setq org-refile-targets
    '(("1 Projects.org" :maxlevel . 1)
      ("2 Areas.org" :maxlevel . 1)
      ("3 Resources.org" :maxlevel . 1)
      ("inbox.org" :maxlevel . 1)
      ("people.org" :maxlevel . 1))))
