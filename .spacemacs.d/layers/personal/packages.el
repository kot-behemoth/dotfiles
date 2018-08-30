(setq personal-packages
      '(;; elsewhere-owned, but with trivial defines
        evil)
      )

(defun personal/post-init-evil ()

  (setq-default evil-escape-key-sequence "ii")
  (setq-default evil-escape-delay 0.3)

  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-normal-state-cursor '("green" box))
  (setq evil-visual-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-replace-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))
  )
