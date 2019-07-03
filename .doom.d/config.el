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

  ;; Add easy way to find
  (:map override
   "M-f" #'swiper-helm)  ;; can also be called via SPC / b

  (:when (featurep! :editor evil)
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

(map!
  :leader
  (:desc "Kill ring" :n "K" #'helm-show-kill-ring))

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

(map!
  :after lsp
  :leader
  (:prefix ("c" . "+code")
    :desc "LSP"
    :n "l" #'hydra-lsp/body))

;; FIXME doesn't necessarily work on macos
(shx-global-mode t)  ; toggle shx-mode on globally

(set-popup-rule! "^\\*shell.*" :side 'bottom :size 20 :slot 3 :select nil :quit nil :modeline t)

;; Range config
(after! ranger
  ;; Override dired-mode so it uses deer
  (setq ranger-deer-show-details t))

;; Direnv
(use-package direnv
 :config
 (direnv-mode))

;; Fix EDITOR handling for shells
;; (after! with-editor
(add-hook 'shell-mode-hook  'with-editor-export-editor)
(add-hook 'term-exec-hook   'with-editor-export-editor)
(add-hook 'eshell-mode-hook 'with-editor-export-editor)

;; Org-mode customisations
(add-hook 'org-mode-hook (lambda! (display-line-numbers-mode 0)))
(after! org
  (setq-default
   org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "LATER(l)" "|" "DONE(d)"))))

;; FIXME: need to add :after (ox-clip shx)
(map!
  :localleader
  :map org-mode-map
  "C" #'ox-clip-formatted-copy
  "p" #'org-cliplink)

;; Focus-mode writing
(after! olivetti
  (setq-default olivetti-body-width 120
                olivetti-hide-mode-line t)

  (defun toggle-focus-mode ()
    (interactive)
    (doom/window-zoom)
    (if (bound-and-true-p olivetti-mode)
      (olivetti-mode 0)
      (olivetti-mode 1))))

(map!
  :after olivetti
  (:map org-mode-map
    :localleader
    :desc "Focus mode"
    :n "f" #'toggle-focus-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tramp speedups
(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
                    vc-ignore-dir-regexp
                    tramp-file-name-regexp))
(setq tramp-verbose 1)

(defadvice projectile-on (around exlude-tramp activate)
  "This should disable projectile when visiting a remote file"
  (unless  (--any? (and it (file-remote-p it))
                   (list
                    (buffer-file-name)
                    list-buffers-directory
                    default-directory
                    dired-directory))
    ad-do-it))

(setq projectile-mode-line "Projectile")


;;;;;;;;;;;;;;;;;;
;; Selecting deleted buffer fix
;; From https://github.com/hlissner/doom-emacs/issues/1525
(after! persp-mode
  (persp-def-buffer-save/load
   :tag-symbol 'def-indirect-buffer
   :predicate #'buffer-base-buffer
   :save-function (lambda (buf tag vars)
                    (list tag (buffer-name buf) vars
                          (buffer-name (buffer-base-buffer buf))))
   :load-function (lambda (savelist &rest _rest)
                    (cl-destructuring-bind (buf-name _vars base-buf-name &rest _)
                        (cdr savelist)
                      (push (cons buf-name base-buf-name)
                            +workspaces--indirect-buffers-to-restore)
                      nil))))

;;;;;;;;;;;;;;;;
;; Docker config
;;;;;;;;;;;;;;;;

(setq docker-container-shell-file-name "/bin/bash")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mac-specific config below
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when IS-MAC
  (setq doom-font (font-spec :family "Fira Code" :size 16))
  (map! :i "M-3" (lambda! (insert "#")))

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
  (setq org-agenda-files '("~/Dropbox/org/tasks.org"))
  (setq org-archive-location (concat org-directory "/archive.org::* Projects"))
  ; http://doc.endlessparentheses.com/Var/org-archive-location.html
  (setq org-refile-targets
    '(("1 Projects.org" :maxlevel . 1)
      ("2 Areas.org" :maxlevel . 1)
      ("3 Resources.org" :maxlevel . 1)
      ("inbox.org" :maxlevel . 1)
      ("people.org" :maxlevel . 1)))

  (setq org-capture-templates
        '(("t" "Task" entry (file "~/org/inbox.org"))
          "* TODO %?\n"
          ("p" "Project" entry
            ; tasks, because the template is very tasks-focused
            (file "~/org/tasks.org")
            (file "~/.doom.d/org-templates/new-project.org"))
          ("w" "Review: Weekly Review" entry (file+olp+datetree "/tmp/reviews.org")
            (file "~/.doom.d/org-templates/weekly-review.org"))
          ("m" "Review: Monthly Review" entry (file+olp+datetree "/tmp/reviews.org")
            (file "~/.doom.d/org-templates/monthly-review.org")))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modules
(load! "+hydras")  ;; All hydras
(when IS-WINDOWS
  (load! "+work")) ;; All work-related, Windows-specific stuff
