;;; ~/dotfiles/.doom.d/+clojure.el -*- lexical-binding: t; -*-

(map!
  (:after cider
   :map (cider-repl-mode)

   "C-k" #'cider-repl-previous-input
   "C-j" #'cider-repl-next-input
   "C-l" #'cider-repl-history))
