;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-localleader-key ",")
(setq doom-theme 'doom-nord-light)
;; (setq doom-font (font-spec :family "Essential PragmataPro" :size 16))
(setq doom-font (font-spec :family "Iosevka Term SS08" :size 16))

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; Fix PATH
(add-to-list 'exec-path "/usr/local/bin")

;; Make gsSPC work in all windows
(setq avy-all-windows t)
(setq auto-window-vscroll nil)

(setq lisp-indent-offset 2)
(setq-default evil-shift-width 2 ;; I normally use 2wide for my projects.
              tab-width 2)

(map!
  :i "M-3" (cmd! (insert "#"))
  :n "j" #'evil-next-visual-line
  :n "k" #'evil-previous-visual-line

  ;; Add easy way to find
  (:map override
   "M-f" #'swiper-helm)  ;; can also be called via SPC / b

  (:after helm-files
   :map (helm-find-files-map helm-read-file-map)
   "C-l"      #'helm-execute-persistent-action
   "C-h"      #'helm-find-files-up-one-level)

  :leader
  (:desc "toggle" :prefix "t"
   :desc "Line wrap" :n "l" #'toggle-truncate-lines)

  (:desc "Kill ring" :n "K" #'helm-show-kill-ring)

  (:prefix "w"
   :desc "Other window" "w"  #'other-window)

  (:prefix "a"
   :desc "Prodigy" "p"  #'prodigy
   :desc "Deer"    "r"  #'deer
   :desc "Ranger"  "R"  #'ranger))

(after! evil-escape
  (setq evil-escape-key-sequence "ii"))

;; Fix exit sequence for `emacsclient' for Joplin external editing
(add-hook 'server-switch-hook
  (lambda ()
    (when (current-local-map)
      (use-local-map (copy-keymap (current-local-map))))
    (when server-buffer-clients
      (local-set-key (kbd "C-c k") 'server-edit))))

;; no need for hard-wrapping in markdown
(remove-hook 'markdown-mode-hook #'auto-fill-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modules
(load! "+docker")
(load! "+ein")
(load! "+eshell")
(load! "+fixes")
(load! "+hydras")
(load! "+lsp")
(load! "+org")
(load! "+prodigy")
(load! "+ranger")
(load! "+shell")
(load! "+tramp")
(load! "+cheatsheet")
(load! "+clojure")

(when IS-WINDOWS
  (load! "+work") ;; All work-related, Windows-specific stuff
  ;; Don't use Emacs' native indexing on Win - very slow
  (setq projectile-indexing-method 'alien))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
  '(ansi-color-names-vector
     ["#282828" "#ff665c" "#7bc275" "#FCCE7B" "#51afef" "#C57BDB" "#5cEfFF" "#bbc2cf"])
  '(custom-safe-themes
     '("99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "e2acbf379aa541e07373395b977a99c878c30f20c3761aac23e9223345526bcc" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "72fda75af7caddec17ba9b49d2f99703c20a5f5f5c4dcec641d34a0b83569e88" "6e2d579b02aadc933f434003f49d269d004f5c7094eb53658afbacc817761d83" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "fa3bdd59ea708164e7821574822ab82a3c51e262d419df941f26d64d015c90ee" "6bacece4cf10ea7dd5eae5bfc1019888f0cb62059ff905f37b33eec145a6a430" "dc677c8ebead5c0d6a7ac8a5b109ad57f42e0fe406e4626510e638d36bcc42df" "9d54f3a9cf99c3ffb6ac8e84a89e8ed9b8008286a81ef1dbd48d24ec84efb2f1" "7dc3fe8fadb914563790a3fbe587fd455626442f66da333ea4de2c455feefb98" "7d56fb712ad356e2dacb43af7ec255c761a590e1182fe0537e1ec824b7897357" "f951343d4bbe5a90dba0f058de8317ca58a6822faa65d8463b0e751a07ec887c" "c8f959fb1ea32ddfc0f50db85fea2e7d86b72bb4d106803018be1c3566fd6c72" "4e132458143b6bab453e812f03208075189deca7ad5954a4abb27d5afce10a9a" "e838d6375a73fda607820c65eb3ea1f9336be7bd9a5528c9161e10c4aa663b5b" "a6e3dec0d16222cc5747743c87ef7da79186f7282e2ec4ff74c7f08ed7fe28d2" "a8c210aa94c4eae642a34aaf1c5c0552855dfca2153fa6dd23f3031ce19453d4" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" default))
 '(fci-rule-color "#62686E")
 '(jdee-db-active-breakpoint-face-colors (cons "#1c1f24" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1c1f24" "#7bc275"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1c1f24" "#484854"))
 '(objed-cursor-color "#ff665c")
 '(pdf-view-midnight-colors (cons "#bbc2cf" "#242730"))
 '(vc-annotate-background "#242730")
  '(vc-annotate-color-map
     (list
       (cons 20 "#7bc275")
       (cons 40 "#a6c677")
       (cons 60 "#d1ca79")
       (cons 80 "#FCCE7B")
       (cons 100 "#f4b96e")
       (cons 120 "#eda461")
       (cons 140 "#e69055")
       (cons 160 "#db8981")
       (cons 180 "#d082ae")
       (cons 200 "#C57BDB")
       (cons 220 "#d874b0")
       (cons 240 "#eb6d86")
       (cons 260 "#ff665c")
       (cons 280 "#d15e59")
       (cons 300 "#a35758")
       (cons 320 "#754f56")
       (cons 340 "#62686E")
       (cons 360 "#62686E")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
