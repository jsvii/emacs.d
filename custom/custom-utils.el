;;; custom-utils.el --- Elisp helper functions and commands -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(maybe-require-package 'treemacs)
(maybe-require-package 'treemacs-projectile)
(maybe-require-package 'treemacs-icons-dired)
(maybe-require-package 'treemacs-magit)

(with-eval-after-load 'treemacs
  (progn
    (setq treemacs-collapse-dirs                 3
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".treemacs/persist" (getenv "HOME"))
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         22)
    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    (treemacs-resize-icons 22)
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))
    ;; keys
    (global-set-key (kbd "C-x t 1") 'treemacs-delete-other-windows)
    (global-set-key (kbd "C-x t B") 'treemacs-bookmark)
    (global-set-key (kbd "C-x t C-t") 'treemacs-find-file)
    (global-set-key (kbd "C-x t M-t") 'treemacs-find-tag)
    )
  )

(with-eval-after-load 'treemacs-magit
  (treemacs-icons-dired-mode))

(global-set-key (kbd "C-x t t") 'treemacs)


;; developer's tools
(maybe-require-package 'ack)

(maybe-require-package 'dash-docs)

(maybe-require-package 'sdcv)


(setq package-check-signature nil)


(provide 'custom-utils)
;;; custom-utils.el ends here
