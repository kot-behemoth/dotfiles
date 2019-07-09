;;; ~/dotfiles/.doom.d/+prodigy.el -*- lexical-binding: t; -*-


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

(map!
  ;; FIXME: probably better done by using evil-collection-prodigy better
  ;; https://github.com/emacs-evil/evil-collection/blob/master/evil-collection-prodigy.el
  (:after prodigy
    (:map prodigy-mode-map)
    "q"  'quit-window

    "j"  'prodigy-next
    "k"  'prodigy-prev
    "gg" 'prodigy-first
    "G"  'prodigy-last

    "Jm" 'prodigy-jump-magit
    "Jd" 'prodigy-jump-dired))
