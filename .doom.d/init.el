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
  ;; (pretty-code       ; replace bits of code with pretty symbols
  ;;   +iosevka)
  (workspaces        ; tab emulation, persistence & separate workspaces
    +switch-window)
  ;;tabbar            ; FIXME an (incomplete) tab bar for Emacs
  ;;unicode           ; extended unicode support for various languages
  vc-gutter         ; vcs diff in the fringe
  vi-tilde-fringe   ; fringe tildes to mark beyond EOB
  window-select     ; visually switch windows
  zen

  :editor
  ;;fold              ; (nigh) universal code folding
  (evil +everywhere); come to the dark side, we have cookies
  file-templates      ; auto-snippets for empty files
  ;;(format +onsave)  ; automated prettiness
  ;;lispy             ; vim for lisp, for people who dont like vim
  ;;multiple-cursors  ; editing in many places at once
  parinfer          ; turn lisp into python, sort of
  ;;rotate-text       ; cycle region at point between text candidates
  word-wrap           ; soft wrapping with language-aware indent

  :emacs
  (dired            ; making dired pretty [functional]
    +ranger          ; bringing the goodness of ranger to dired
    +icons)           ; colorful icons for dired-mode
  electric          ; smarter, keyword-based electric-indent
  (ibuffer           ; interactive buffer management
    +icons)
  vc                ; version-control and Emacs, sitting in a tree

  :term
  eshell            ; a consistent, cross-platform shell (WIP)
  shell             ; a terminal REPL for Emacs
  ;;term              ; terminals in Emacs
  vterm             ; another terminals in Emacs

  :checkers
  syntax              ; tasing you for every semicolon you forget
  spell             ; tasing you for misspelling mispelling
  ;;grammar           ; tasing grammar mistake every you make

  :tools
  ;;ansible
  (docker +lsp)
  direnv
  ;;editorconfig      ; let someone else argue about tabs vs spaces
  (lookup           ; helps you navigate your code and documentation
    +docsets)        ; ...or in Dash docsets locally
  (eval +overlay)    ; run code, run (also, repls)
                                        ;ein               ; tame Jupyter notebooks with emacs
  ;;gist              ; interacting with github gists
  lsp
  macos             ; MacOS-specific commands
  make              ; run make tasks from Emacs
  magit             ; a git porcelain for Emacs
  ;;password-store    ; password manager for nerds
  ;;pdf               ; pdf enhancements
  prodigy           ; FIXME managing external services & code builders
  ;;rgb               ; creating color strings
  ;;terraform         ; infrastructure as code
  tmux              ; an API for interacting with tmux
  upload            ; map local to remote projects via ssh/ftp
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
    +pandoc)          ; pandoc integration into org's exporter
                                        ;+present)        ; using Emacs for presentations

  ;;perl              ; write code no one else can comprehend
  ;;php               ; perl's insecure younger brother
  ;;plantuml          ; diagrams for confusing people more
  ;;purescript        ; javascript, but functional
  (python
    +pyenv
    +conda
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
  (web
    +lsp
    +css
    +html)          ; the tubes
  ;;vala              ; GObjective-C

  ;; Applications are complex and opinionated modules that transform Emacs
  ;; toward a specific purpose. They may have additional dependencies and
  ;; should be loaded late.
  :app
  ;;(email +gmail)    ; emacs as an email client
  ;;irc               ; how neckbeards socialize
  ;;(rss +org)        ; emacs as an RSS reader
  ;;twitter           ; twitter client https://twitter.com/vnoughk

  :collab

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
  '(ansi-color-names-vector
     ["#D8DEE9" "#ff665c" "#7bc275" "#FCCE7B" "#51afef" "#C57BDB" "#5cEfFF" "#bbc2cf"])
  '(custom-safe-themes
     (quote
       ("72fda75af7caddec17ba9b49d2f99703c20a5f5f5c4dcec641d34a0b83569e88" "6e2d579b02aadc933f434003f49d269d004f5c7094eb53658afbacc817761d83" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "fa3bdd59ea708164e7821574822ab82a3c51e262d419df941f26d64d015c90ee" "6bacece4cf10ea7dd5eae5bfc1019888f0cb62059ff905f37b33eec145a6a430" "dc677c8ebead5c0d6a7ac8a5b109ad57f42e0fe406e4626510e638d36bcc42df" "9d54f3a9cf99c3ffb6ac8e84a89e8ed9b8008286a81ef1dbd48d24ec84efb2f1" "7dc3fe8fadb914563790a3fbe587fd455626442f66da333ea4de2c455feefb98" "7d56fb712ad356e2dacb43af7ec255c761a590e1182fe0537e1ec824b7897357" "f951343d4bbe5a90dba0f058de8317ca58a6822faa65d8463b0e751a07ec887c" "c8f959fb1ea32ddfc0f50db85fea2e7d86b72bb4d106803018be1c3566fd6c72" "4e132458143b6bab453e812f03208075189deca7ad5954a4abb27d5afce10a9a" "e838d6375a73fda607820c65eb3ea1f9336be7bd9a5528c9161e10c4aa663b5b" "a6e3dec0d16222cc5747743c87ef7da79186f7282e2ec4ff74c7f08ed7fe28d2" "a8c210aa94c4eae642a34aaf1c5c0552855dfca2153fa6dd23f3031ce19453d4" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" default)))
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
