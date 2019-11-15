;;; init.el -*- lexical-binding: t; -*-
;;
;; ~/.doom.d/init.el file is loaded before any modules are!

(doom! :completion
  company           ; the ultimate code completion backend
  helm              ; the *other* search engine for love and life

  :ui
  doom              ; what makes DOOM look the way it does
  doom-dashboard    ; a nifty splash screen for Emacs
  doom-quit         ; DOOM quit-message prompts when you quit Emacs
  hl-todo           ; highlight TODO/FIXME/NOTE tags
  hydra
  modeline          ; snazzy, Atom-inspired modeline, plus API
  nav-flash         ; blink the current line after jumping
  ;;neotree           ; a project drawer, like NERDTree for vim
  ophints           ; highlight the region an operation acts on
  treemacs          ; a project drawer, like neotree but cooler
  (popup            ; tame sudden yet inevitable temporary windows
    +all             ; catch all popups that start with an asterix
    +defaults)       ; default popup rules
  ;;pretty-code       ; replace bits of code with pretty symbols
  (workspaces        ; tab emulation, persistence & separate workspaces
    +switch-window)
  ;;tabbar            ; FIXME an (incomplete) tab bar for Emacs
  ;;unicode           ; extended unicode support for various languages
  vc-gutter         ; vcs diff in the fringe
  vi-tilde-fringe   ; fringe tildes to mark beyond EOB
  window-select     ; visually switch windows

  :editor
  ;;fold              ; (nigh) universal code folding
  (evil +everywhere); come to the dark side, we have cookies
  file-templates      ; auto-snippets for empty files
  ;;(format +onsave)  ; automated prettiness
  ;;lispy             ; vim for lisp, for people who dont like vim
  ;;multiple-cursors  ; editing in many places at once
  parinfer          ; turn lisp into python, sort of
  ;;rotate-text       ; cycle region at point between text candidates

  :emacs
  (dired            ; making dired pretty [functional]
                                        ; +ranger          ; bringing the goodness of ranger to dired
    +icons)           ; colorful icons for dired-mode
  electric          ; smarter, keyword-based electric-indent
  ibuffer           ; interactive buffer management
  vc                ; version-control and Emacs, sitting in a tree

  :term
  eshell            ; a consistent, cross-platform shell (WIP)
  shell             ; a terminal REPL for Emacs
  ;;term              ; terminals in Emacs
  vterm             ; another terminals in Emacs

  :tools
  ;;ansible
  docker
  direnv
  ;;editorconfig      ; let someone else argue about tabs vs spaces
  (lookup           ; helps you navigate your code and documentation
    +docsets)        ; ...or in Dash docsets locally
  (eval +overlay)    ; run code, run (also, repls)
                                        ;ein               ; tame Jupyter notebooks with emacs
  flycheck          ; tasing you for every semicolon you forget
  ;;flyspell          ; tasing you for misspelling mispelling
  ;;gist              ; interacting with github gists
  lsp
  macos             ; MacOS-specific commands
  make              ; run make tasks from Emacs
  magit             ; a git porcelain for Emacs
  ;;password-store    ; password manager for nerds
  ;;pdf               ; pdf enhancements
  prodigy           ; FIXME managing external services & code builders
  ;;rgb               ; creating color strings
  terraform         ; infrastructure as code
  tmux              ; an API for interacting with tmux
  ;;upload            ; map local to remote projects via ssh/ftp
  ;;wakatime

  :lang
  ;;assembly          ; assembly for fun or debugging
  ;;(cc +irony +rtags); C/C++/Obj-C madness
  clojure           ; java with a lisp
  ;;common-lisp       ; if you've seen one lisp, you've seen them all
  ;;coq               ; proofs-as-programs
  ;;crystal           ; ruby at the speed of c
  ;;csharp            ; unity, .NET, and mono shenanigans
  data              ; config/data formats
  ;;erlang            ; an elegant language for a more civilized age
  ;;elixir            ; erlang done right
  ;;elm               ; care for a cup of TEA?
  emacs-lisp        ; drown in parentheses
  ;;ess               ; emacs speaks statistics
  ;;go                ; the hipster dialect
  ;;(haskell +intero) ; a language that's lazier than I am
  ;;hy                ; readability of scheme w/ speed of python
  ;;idris             ;
  ;;(java +meghanada) ; the poster child for carpal tunnel syndrome
  javascript        ; all(hope(abandon(ye(who(enter(here))))))
  ;;julia             ; a better, faster MATLAB
  ;;latex             ; writing papers in Emacs has never been so fun
  ;;ledger            ; an accounting system in Emacs
  ;;lua               ; one-based indices? one-based indices
  markdown            ; writing docs for people to ignore
  ;;nim               ; python + lisp at the speed of c
  ;;nix               ; I hereby declare "nix geht mehr!"
  ;;ocaml             ; an objective camel
  (org
    +dragndrop       ; file drag & drop support
    +ipython         ; ipython support for babel
    +pandoc          ; pandoc integration into org's exporter
    +present)        ; using Emacs for presentations

  ;;perl              ; write code no one else can comprehend
  ;;php               ; perl's insecure younger brother
  ;;plantuml          ; diagrams for confusing people more
  ;;purescript        ; javascript, but functional
  (python
    +conda
    +pyenv
    +lsp)             ; beautiful is better than ugly
  ;;qt                ; the 'cutest' gui framework ever
  ;;racket            ; a DSL for DSLs
  rest              ; Emacs as a REST client
  ;;ruby              ; 1.step do {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
  ;;rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
  ;;scala             ; java, but good
  (sh +lsp)           ; she sells (ba|z|fi)sh shells on the C xor
  ;;solidity          ; do you need a blockchain? No.
  ;;swift             ; who asked for emoji variables?
  (web +lsp)          ; the tubes
  ;;vala              ; GObjective-C

  ;; Applications are complex and opinionated modules that transform Emacs
  ;; toward a specific purpose. They may have additional dependencies and
  ;; should be loaded late.
  :app
  ;;(email +gmail)    ; emacs as an email client
  ;;irc               ; how neckbeards socialize
  ;;(rss +org)        ; emacs as an RSS reader
  ;;twitter           ; twitter client https://twitter.com/vnoughk
  ;;(write            ; emacs as a word processor (latex + org + markdown)
  ;; +wordnut         ; wordnet (wn) search
  ;; +langtool)       ; a proofreader (grammar/style check) for Emacs

  :collab
  ;;floobits          ; peer programming for a price
  ;;impatient-mode    ; show off code over HTTP

  :config
  ;; The default module sets reasonable defaults for Emacs. It also
  ;; provides a Spacemacs-inspired keybinding scheme, a custom yasnippet
  ;; library, and additional ex commands for evil-mode. Use it as a
  ;; reference for your own modules.
  (default +bindings +evil-commands))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
  '(custom-safe-themes
     (quote
       ("7d56fb712ad356e2dacb43af7ec255c761a590e1182fe0537e1ec824b7897357" "f951343d4bbe5a90dba0f058de8317ca58a6822faa65d8463b0e751a07ec887c" "c8f959fb1ea32ddfc0f50db85fea2e7d86b72bb4d106803018be1c3566fd6c72" "4e132458143b6bab453e812f03208075189deca7ad5954a4abb27d5afce10a9a" "e838d6375a73fda607820c65eb3ea1f9336be7bd9a5528c9161e10c4aa663b5b" "a6e3dec0d16222cc5747743c87ef7da79186f7282e2ec4ff74c7f08ed7fe28d2" "a8c210aa94c4eae642a34aaf1c5c0552855dfca2153fa6dd23f3031ce19453d4" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
