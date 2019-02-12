;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-font (font-spec :family "Consolas" :size 16))
(setq doom-localleader-key ",")
;; Make gsSPC work in all windows
(setq avy-all-windows t)

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

      (:map shell-mode-map
        "C-k"      #'comint-previous-input
        "C-j"      #'comint-next-input
        "C-l"      #'helm-comint-input-ring)

      ;; LEADER-based shortcuts
      :leader
      (:desc "toggle" :prefix "t"
        :desc "Line wrap" :n "l" #'toggle-truncate-lines)

      (:after dired
        (:prefix ("o" . "open")
          :desc "Deer" "r"  #'deer
          :desc "Ranger" "R"  #'ranger)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shells

(set-popup-rule! "^\\*shell.*" :side 'right :size 80 :slot 3 :select nil :quit nil :modeline t)
(set-popup-rule! "^\\*cmd.exe" :side 'right :size 80 :vslot 1 :select nil)
(set-popup-rule! "^\\*PowerShell" :side 'right :size 80 :vslot 2 :select nil)


