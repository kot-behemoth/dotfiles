;;; ~/dotfiles/.doom.d/+org.el -*- lexical-binding: t; -*-

;; Org-mode customisations
(add-hook 'org-mode-hook (cmd! (display-line-numbers-mode 0)))

(after! org
  (setq-default
   org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "LATER(l)" "|" "DONE(d)"))))

;; FIXME: need to add :after (ox-clip shx)
(map!
  :localleader
  :map org-mode-map
  "t" #'org-todo
  "C" #'ox-clip-formatted-copy
  "p" #'org-cliplink)

(setq org-directory "~/Dropbox/org")
(setq org-agenda-files '("~/Dropbox/org/tasks.org"))
(setq org-archive-location (concat org-directory "/archive.org::* Projects"))
; http://doc.endlessparentheses.com/Var/org-archive-location.html
(setq org-refile-targets
  '(("1 Projects.org" :maxlevel . 1)
    ("2 Areas.org" :maxlevel . 1)
    ("3 Resources.org" :maxlevel . 1)
    ("inbox.org" :maxlevel . 1)))

(setq org-capture-templates
      '(("t" "Task" entry (file "~/org/inbox.org"))
        "* TODO %?\n"
        ("p" "Project" entry
          ; tasks, because the template is very tasks-focused
          (file "~/org/tasks.org")
          (file "~/.doom.d/org-templates/new-project.org"))
        ("w" "Review: Weekly Review" entry (file+olp+datetree "/tmp/reviews.org")
          (file "~/.doom.d/org-templates/weekly-review.org"))
        ("m" "Review: Monthly Review" entry (file+olp+datetree "/tmp/reviews.org")
          (file "~/.doom.d/org-templates/monthly-review.org"))))

(defun +org-init-keybinds-h ()
  (map!
    :map org-mode-map
    :localleader

    :desc "org-refile"
    :n "R" #'org-refile

    :desc "org-rifle"
    :n "r" #'helm-org-rifle-org-directory))

(add-hook! 'org-load-hook
  #'+org-init-keybinds-h)

;; Org-roam customisations
(after! org-roam
  (setq org-roam-directory "~/Dropbox/org/org-roam"))
        ;; org-roam-graph-viewer "open -a /Applications/Firefox.app -new-tab"))

(after! deft
  (setq
    deft-recursive t
    deft-use-filter-string-for-filename t
    deft-default-extension "org"
    deft-directory "~/Dropbox/org/org-roam"))

;; Org-journal customisations
(setq
  org-journal-dir "~/Dropbox/org/org-roam"
  org-journal-date-prefix "#+title: "
  org-journal-file-format "%Y-%m-%d.org"
  org-journal-date-format "%A, %d %B %Y")
