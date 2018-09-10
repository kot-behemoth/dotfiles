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
                explicit-shell-file-name  "cmdproxy.exe"
                ;; this will be used by subprocesses that are started with
                ;; shell-command and related non-interactive shell commands.
                ;; Let's keep it the same, so it's bash.exe. Less warnings.
                ;; shell-file-name           "cmd.exe"
                shell-default-shell       'shell
                shell-default-height      30
                shell-default-position    'bottom)
       '(shell :variables
               shell-default-shell        'eshell))

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
                                      web-mode
                                      writeroom-mode
                                      minimal-theme)
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
   dotspacemacs-themes '(minimal-light
                         monokai)

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

  (add-hook 'ein:notebook-multilang-mode-hook
            #'(lambda () (spacemacs/toggle-whitespace-cleanup-off)))
  )
