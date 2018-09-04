(setq personal-packages
      '(;; elsewhere-owned, but with trivial defines
        evil)
      )

(defun personal/post-init-evil ()
  (setq-default
   evil-escape-key-sequence "ii"
   evil-escape-delay 0.3

   evil-emacs-state-cursor '("red" box)
   evil-normal-state-cursor '("green" box)
   evil-visual-state-cursor '("orange" box)
   evil-insert-state-cursor '("red" bar)
   evil-replace-state-cursor '("red" bar)
   evil-operator-state-cursor '("red" hollow)
  ))
