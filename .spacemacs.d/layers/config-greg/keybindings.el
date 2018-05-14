(global-set-key
 (kbd "C-k") `evil-scroll-page-up)
(global-set-key
 (kbd "C-j") `evil-scroll-page-down)

; TODO: trying to fix inserting # sign without triggering window-numbering
(global-set-key
 [(M \3)] "#")
;; Actually allow typing #
(global-set-key
 (kbd "M-3") `(lambda () (interactive) (insert "#")))

; Move across visual lines, even if it's one long wrapped line
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(define-key global-map [?\s-x] 'kill-region)
(define-key global-map [?\s-c] 'kill-ring-save)
(define-key global-map [?\s-v] 'yank)
