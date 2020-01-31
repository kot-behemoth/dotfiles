;;; ~/dotfiles/.doom.d/+clojure.el -*- lexical-binding: t; -*-

(map!
  (:after cider
   :map (cider-repl-mode)

   "C-k" #'cider-repl-previous-input
   "C-j" #'cider-repl-next-input
   "C-l" #'cider-repl-history))

(use-package! flycheck-clj-kondo
  :hook (clojure-mode . cider-mode)
  :after flycheck
  :commands clj-kondo-clj clj-kondo-cljs clj-kondo-cljc clj-kondo-edn)

(after! flycheck-joker
  (dolist (checker '(clj-kondo-clj clj-kondo-cljs clj-kondo-cljc clj-kondo-edn))
   (setq flycheck-checkers (cons checker (delq checker flycheck-checkers)))))
  ;; (dolist (checkers '((clj-kondo-clj . clojure-joker)
  ;;                     (clj-kondo-cljs . clojurescript-joker)
  ;;                     (clj-kondo-cljc . clojure-joker)
  ;;                     (clj-kondo-edn . edn-joker)))
  ;;   (flycheck-add-next-checker (car checkers) (cons 'error (cdr checkers)))))
