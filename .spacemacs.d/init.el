;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defvar windows? (eq system-type 'windows-nt)
  "Are we on a Windows machine?")

(defun os-path (path)
  "Prepend drive label to PATH if on windows machine."
  (if windows?
    (expand-file-name path "c:")
    path))

;;; Spacemacs/

(defun dotspacemacs/init ()
  "Instantiate Spacemacs core settings."
  (dotspacemacs/init/proxy)
  (dotspacemacs/init/coding)
  (dotspacemacs/init/display)
  (dotspacemacs/init/evil)
  (dotspacemacs/init/keys)
  (dotspacemacs/init/layouts)
  (dotspacemacs/init/misc)
  (dotspacemacs/init/packages)
  (dotspacemacs/init/startup))

(defun dotspacemacs/layers ()
  "Instantiate Spacemacs layers declarations and package configurations."
  (dotspacemacs/layers/config)
  (dotspacemacs/layers/packages))

;; (defun dotspacemacs/user-init ()
;;   "Package independent settings to run before `dotspacemacs/user-config'."
;;   (setq custom-file "./elisp/.custom-settings.el"))

(defun dotspacemacs/user-config ()
  "Configuration that cannot be delegated to layers."
  (dotspacemacs/user-config/toggles)
  (dotspacemacs/user-config/experiments))


;;; Spacemacs/Layers
;;;; Local

(defvar dotspacemacs/layers/local
  '((personal :location local))  ; Personal config for everything

  "Local layers housed in `~/.spacemacs.d/layers'.")

;;;; Core

(defvar dotspacemacs/layers/core
  `(better-defaults
    git
    syntax-checking
    org

    ,(if windows?
        '(shell :variables
                explicit-shell-file-name  "C:/Users/gg85560/AppData/Local/Programs/Git/bin/bash.exe"
                shell-file-name           "C:/Users/gg85560/AppData/Local/Programs/Git/bin/bash.exe"
                explicit-bash.exe-args    '("--login"  "-i")
                shell-default-height      30
                shell-default-position    'bottom)
       '(shell :variables
               explicit-shell-file-name   "/usr/local/bin/bash"
               shell-file-name            "/usr/local/bin/bash"))

    (auto-completion :variables
                     auto-completion-return-key-behavior      'complete
                     auto-completion-tab-key-behavior         'complete
                     auto-completion-enable-snippets-in-popup t)
    version-control)

  "Layers I consider core to Spacemacs.")

;;;; Langs

(defvar dotspacemacs/layers/langs
  '(;; Markups
    csv
    html
    markdown

    ;; Languages
    emacs-lisp
    javascript
    ipython-notebook
    sql
    ess

    (clojure :variables
              clojure-enable-fancify-symbols t)
    (python :variables
            python-test-runner 'pytest
            :packages
            (not importmagic)))  ; Broken? Don't need it.

  "Programming and markup language layers.")

;;;; Extra

(defvar dotspacemacs/layers/extra
  '(
    (if (not windows?) osx)
    vinegar
    evil-commentary
    themes-megapack
    docker

    (ranger :variables
            ranger-show-preview t
            ranger-show-hidden t
            ranger-cleanup-eagerly t
            ranger-cleanup-on-disable t
            ranger-ignored-extensions '("mkv" "flv" "iso" "mp4" "zip")))

  "Miscellaneous layers.")

;;;; Layers/config

(defun dotspacemacs/layers/config ()
  (setq-default
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path  `(,(os-path "~/.spacemacs.d/layers/"))
   dotspacemacs-configuration-layers      `(,@dotspacemacs/layers/local
                                            ,@dotspacemacs/layers/core
                                            ,@dotspacemacs/layers/langs
                                            ,@dotspacemacs/layers/extra))
   dotspacemacs-distribution               'spacemacs
   dotspacemacs-enable-lazy-installation   'unused)

;;;; Layers/packages

(defun dotspacemacs/layers/packages ()
  (setq-default
   dotspacemacs-additional-packages '(pcre2el
                                      evil-escape
                                      yaml-mode
                                      json-mode
                                      wsd-mode
                                      web-mode)
   dotspacemacs-excluded-packages '(importmagic)
   dotspacemacs-frozen-packages '()
   dotspacemacs-install-packages 'used-but-keep-unused))

;;; Spacemacs/Init
;;;; Coding

(defun dotspacemacs/init/coding ()
  (setq-default
   dotspacemacs-folding-method 'evil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-line-numbers nil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-search-tools '("ag" "rg" "pt" "ack" "grep")
   dotspacemacs-smooth-scrolling t
   dotspacemacs-whitespace-cleanup 'trailing))

;;;; Display

(defun dotspacemacs/init/display ()
  (setq-default
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         solarized-light)

   dotspacemacs-default-font (if windows?
                                 ;; we're on windows
                                 '("Consolas" :size 18)
                                 ;; mac font
                                 '("Menlo" :size 16))

   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   ;; dotspacemacs-frame-title-format "%I@%S"
   ;; dotspacemacs-icon-title-format nil
   ;; dotspacemacs-pretty-docs t
   ))

;;;; Evil

(defun dotspacemacs/init/evil ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t))

;;;; Keys

(defun dotspacemacs/init/keys ()
  (setq-default
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-distinguish-gui-tab nil))

;;;; Layouts

(defun dotspacemacs/init/layouts ()
  (setq-default
   dotspacemacs-scratch-mode 'org-mode
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names t
   dotspacemacs-switch-to-buffer-prefers-purpose nil))

;;;; Misc

(defun dotspacemacs/init/misc ()
  (setq-default
   dotspacemacs-large-file-size 5
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-persistent-server nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom))

;;;; Proxy

(defun dotspacemacs/init/proxy ()
  ;; Corporate proxy
  (if windows?
      (setq-default url-proxy-services
                    '(("http" . "webproxy.ssmb.com:8092")
                      ("https" . "webproxy.ssmb.com:8092")
                      ("no_proxy" . "^\\(localhost\\|127.*\\|.*nsroot.net\\)")))))

;;;; Packages

(defun dotspacemacs/init/packages ()
  (setq-default
   dotspacemacs-default-package-repository nil

   dotspacemacs-elpa-https (if windows? nil t)
   dotspacemacs-elpa-timeout (if windows? 300 5)

   dotspacemacs-check-for-update t
   dotspacemacs-elpa-subdirectory nil))

;;;; Startup

(defun dotspacemacs/init/startup ()
  (setq-default
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-loading-progress-bar t))


;;; Spacemacs/User-Config
;;;; Toggles

(defun dotspacemacs/user-config/toggles ()
  "Spacemacs toggles not intended to be put into layers."
  (spacemacs/toggle-highlight-long-lines-globally-on)
  (spacemacs/toggle-mode-line-minor-modes-off)
  ;; (spacemacs/toggle-aggressive-indent-globally-on)
  (global-highlight-parentheses-mode 1)
  (rainbow-delimiters-mode-enable)
  (fringe-mode '(0 . 8)))

;;;; Experiments

(defun dotspacemacs/user-config/experiments ()
  "Space for trying out configuration updates."
  (setq-default powerline-default-separator nil)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ranger define-word flycheck-pos-tip pos-tip clj-refactor inflections edn paredit cider sesman seq queue flycheck clojure-snippets peg cider-eval-sexp-fu clojure-mode zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color wsd-mode ws-butler winum white-sand-theme which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme sql-indent spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs rebecca-theme rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme powershell popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode launchctl js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eval-sexp-fu ess-smart-equals ess-R-data-view espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav ein dumb-jump dracula-theme dockerfile-mode docker django-theme diminish diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode conda company-web company-tern company-statistics company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C")))))
