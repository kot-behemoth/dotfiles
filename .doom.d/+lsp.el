;;; ~/dotfiles/.doom.d/+lsp.el -*- lexical-binding: t; -*-

(map!
  :after lsp
  :leader
  (:prefix ("c" . "+code")
    :desc "LSP"
    :n "l" #'hydra-lsp/body))
