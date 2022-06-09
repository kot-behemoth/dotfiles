;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! shx)
(package! org-cliplink)
(package! ox-clip)
(package! helm-org-rifle)
(package! cheatsheet)
(package! hercules)

;(package! vuiet)
(package! lastfm)
(package! wsd-mode)

; HACK
;; (package! helm-easymenu :recipe (:fetcher github :repo "emacs-helm/helm"))

;; Fix for CIDER map issue: https://github.com/hlissner/doom-emacs/issues/5537
(package! map :pin "bb50dbaafc0f71743bd9ffd5784258a9fd682c20")
