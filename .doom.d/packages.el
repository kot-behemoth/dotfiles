;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

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
