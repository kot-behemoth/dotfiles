;;; +shell.el -*- lexical-binding: t; -*-

;; FIXME doesn't necessarily work on macos
(shx-global-mode 1)  ; toggle shx-mode on globally

;; Fix EDITOR handling for shells
(add-hook 'shell-mode-hook  'with-editor-export-editor)

(set-popup-rule! "^\\*shell.*" :side 'bottom :size 20 :slot 3 :select nil :quit nil :modeline t)

(map!
  (:map comint-mode-map
    "C-k" #'comint-previous-input
    "C-j" #'comint-next-input
    "M-k" #'comint-previous-prompt
    "M-j" #'comint-next-prompt
    "C-l" #'helm-comint-input-ring)

  :leader
  (:prefix "o"
   :desc "Shell toggle" "s"  #'+shell/toggle
   :desc "Shell here" "S"  #'+shell/here))
