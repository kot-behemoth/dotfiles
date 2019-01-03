;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-font (font-spec :family "Consolas" :size 16))
(setq doom-localleader-key ",")

(map! (:after helm-files
        :map (helm-find-files-map helm-read-file-map)
        "C-l"      #'helm-execute-persistent-action
        "C-h"      #'helm-find-files-up-one-level
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

