;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-font (font-spec :family "Consolas" :size 16))
(setq doom-localleader-key ",")

(map! (:after helm-files
        :map (helm-find-files-map helm-read-file-map)
        "C-l"      #'helm-execute-persistent-action
        "C-h"      #'helm-find-files-up-one-level
        )

      (:when (featurep! :feature helm)
        "M-f" #'swiper-helm
      )

      (:when (featurep! :feature evil)
        :n "j" #'evil-next-visual-line
        :n "k" #'evil-previous-visual-line
        )

      ;; LEADER-based shortcuts
      :leader
      (:desc "toggle" :prefix "t"
        :desc "Line wrap" :n "l" #'toggle-truncate-lines
        )

      (:after dired
        (:prefix ("o" . "open")
            :desc "Ranger" "r"  #'ranger
            ))
      )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Parinfer

(after! clojure-mode
  (set-popup-rules!
    '(("^\\*cider-repl" :vslot 1 :quit nil)))

  (def-package! parinfer
    :init
    ;; (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    ;; (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    ;; (add-hook 'scheme-mode-hook #'parinfer-mode)
    ;; (add-hook 'lisp-mode-hook #'parinfer-mode)
    :hook (clojure-mode . parinfer-mode)
    :config
    (setq parinfer-extensions
          '(defaults       ; should be included.
            pretty-parens  ; different paren styles for different modes.
            evil           ; If you use Evil.
            lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
            paredit        ; Introduce some paredit commands.
            smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
            smart-yank))   ; Yank behavior depend on mode.

    :hook (clojure-mode . parinfer-mode)

    (map! :localleader
          (:map clojure-mode-map
            ;; toggle
            (:prefix "t"
              :n "p" #'parinfer-toggle-mode)))))
