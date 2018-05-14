;;; packages.el --- config-greg layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Greg Goltsov <greg.goltsov@syd-dig-mn23.macsc.net.au>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `config-greg-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `config-greg/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `config-greg/pre-init-PACKAGE' and/or
;;   `config-greg/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst config-greg-packages
  '(
    pcre2el
    evil-escape
    yaml-mode
    json-mode
    wsd-mode
    web-mode

    all-the-icons
    all-the-icons-dired
    pretty-mode
    spaceline-all-the-icons
    )
  )

;;;; All-the-icons-dired

(defun config-greg/init-all-the-icons-dired ()
  (use-package all-the-icons-dired
    :config
    (add-hook 'dired-mode-hook
              'all-the-icons-dired-mode)))

;;; packages.el ends here
