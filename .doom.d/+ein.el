;;; +ein.el -*- lexical-binding: t; -*-

(after! ein
  ;; Don't slice images into rows; easier to navigate around images
  (setq ein:slice-image nil))

(map!
  (:after ein
   (:map ein:notebook-mode-map
    :ni [C-return]     #'ein:worksheet-execute-cell
    :ni [S-return]     #'ein:worksheet-execute-cell-and-goto-next)

   :localleader
   (:map ein:notebook-mode-map "," #'+ein-hydra/body)))
