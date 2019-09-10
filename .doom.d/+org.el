;;; ~/dotfiles/.doom.d/+org.el -*- lexical-binding: t; -*-

;; Org-mode customisations
(add-hook 'org-mode-hook (lambda! (display-line-numbers-mode 0)))

(after! org
  (setq-default
   org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "LATER(l)" "|" "DONE(d)"))))

;; FIXME: need to add :after (ox-clip shx)
(map!
  :localleader
  :map org-mode-map
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
    ("inbox.org" :maxlevel . 1)
    ("people.org" :maxlevel . 1)))

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

;; Focus-mode writing
(after! olivetti
  (setq-default olivetti-body-width 80)

  (defun toggle-focus-mode ()
    (interactive)
    (doom/window-maximize-buffer)
    (if (bound-and-true-p olivetti-mode)
      (olivetti-mode 0)
      (olivetti-mode 1))))

(map!
  :map org-mode-map :desc "widen" :n "z w" #'widen

  :after olivetti
  :map text-mode-map
  :localleader
  :desc "Focus mode"
  :n "F" #'toggle-focus-mode)

(map!
  :map org-mode-map
  :localleader

  :desc "org-refile"
  :n "R" #'org-refile

  :desc "org-rifle"
  :n "r" #'helm-org-rifle-org-directory)
