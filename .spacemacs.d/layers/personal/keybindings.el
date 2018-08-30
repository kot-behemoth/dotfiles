(global-set-key (kbd "C-k") `evil-scroll-page-up)
(global-set-key (kbd "C-j") `evil-scroll-page-down)

;; Turn on horizontal scrolling with mouse wheel
(global-set-key (kbd "<triple-wheel-left>") 'scroll-right)
(global-set-key (kbd "<triple-wheel-right>") 'scroll-left)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Actually allow typing # - SHOULD BE MAC ONLY
(global-set-key (kbd "M-3") `(lambda () (interactive) (insert "#")))
(global-set-key [(M \3)] "#")

(define-key global-map [?\s-x] 'kill-region)
(define-key global-map [?\s-c] 'kill-ring-save)
(define-key global-map [?\s-v] 'yank)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; two lines at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
