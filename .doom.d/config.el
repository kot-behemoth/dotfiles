;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-localleader-key ",")
;; Make gsSPC work in all windows
(setq avy-all-windows t)
(setq lisp-indent-offset 2)
(setq doom-theme 'doom-molokai)

(map! (:after helm-files
        :map (helm-find-files-map helm-read-file-map)
        "C-l"      #'helm-execute-persistent-action
        "C-h"      #'helm-find-files-up-one-level)

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
      "q" 'quit-window

      "j" 'prodigy-next
      "k" 'prodigy-prev
      "gg" 'prodigy-first
      "G" 'prodigy-last

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
  '(("inbox.org" :maxlevel . 1)
    ("projects.org" :maxlevel . 1)
    ("people.org" :maxlevel . 1)
    ("areas.org" :maxlevel . 1)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package config
(after! evil-escape
  (setq evil-escape-key-sequence "ii"))

(after! shx
  (shx-global-mode 1))  ; toggle shx-mode on globally

(map!
  :map org-mode-map
  :localleader "p" #'org-cliplink)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Windows-specific
(setq doom-font (font-spec :family "Consolas" :size 16))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mac-specific
;; TODO: add IS_MAC etc
(setq doom-font (font-spec :family "Fira Code" :size 16))
(global-set-key (kbd "A-3") '(lambda () (interactive) (insert "#")))


(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shells

(set-popup-rule! "^\\*shell.*" :side 'right :size 80 :slot 3 :select nil :quit nil :modeline t)
(set-popup-rule! "^\\*cmd.exe" :side 'right :size 80 :vslot 1 :select nil)
(set-popup-rule! "^\\*PowerShell" :side 'right :size 80 :vslot 2 :select nil)


