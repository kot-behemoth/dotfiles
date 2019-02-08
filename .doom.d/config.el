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


      (:when (featurep! :feature helm)
        "M-f" #'swiper-helm)


      (:when (featurep! :feature evil)
        :n "j" #'evil-next-visual-line
        :n "k" #'evil-previous-visual-line)


      ;; LEADER-based shortcuts
      :leader
      (:desc "toggle" :prefix "t"
        :desc "Line wrap" :n "l" #'toggle-truncate-lines)


      (:after dired
        (:prefix ("o" . "open")
          :desc "Ranger" "r"  #'ranger)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shells

(set-popup-rule! "^\\*cmd.exe" :side 'right :size 80 :vslot 1 :select nil)
(set-popup-rule! "^\\*PowerShell" :side 'right :size 80 :vslot 2 :select nil)
(set-popup-rule! "^\\*shell" :side 'right :size 80 :vslot 3 :select nil)
