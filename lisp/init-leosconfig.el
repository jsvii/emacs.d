;;; init-leosconfig.el
;;;
;;;

;; Gui related
;; 只对GUI有效
(set-face-attribute 'default nil :height 200)

(global-set-key (kbd "M-x") 'helm-M-x)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq projectile-project-search-path '("~/workspace/bamboo/"
                                       "~/workspace/bitbucket/"))


;; magit
(setq magit-repository-directories
      `(("~/workspace/" . 3)
        (,user-emacs-directory . 1)))



(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))

(setq debug-on-error t)

(setq package-check-signature nil)

(setq multi-term-program "/bin/zsh")

(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|127.*\\|mysuse\\)")
        ("http" . "localhost:8118")
        ("https" . "localhost:8118")))

(require 'dash-docs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; pyim input method
;;
;;
(require 'pyim)
(setq default-input-method "pyim")
(require 'pyim-basedict)
(require 'pyim-wbdict)
(setq pyim-page-length 7)
(after-load 'pyim
  (setq pyim-punctuation-dict
        '(("'" "‘" "’")
          ("\"" "“" "”")
          ("_" "——")
          ("^" "…")
          ("]" "】")
          ("[" "【")
          ("@" "◎")
          ("?" "？")
          (">" "》")
          ("=" "＝")
          ("<" "《")
          (";" "；")
          (":" "：")
          ("\\" "、")
          ("." "。")
          ("-" "－")
          ("," "，")
          ("+" "＋")
          ("*" "×")
          (")" "）")
          ("(" "（")
          ("&" "※")
          ("%" "％")
          ("$" "￥")
          ("#" "＃")
          ("!" "！")
          ("`" "・")
          ("~" "～")
          ("}" "』")
          ("|" "÷")
          ("{" "『"))))

(defun pyim-toggle-pinyin ()
  "`pyim-toggle-pinyin` 切换至拼音输入法"
  (interactive)
  (pyim-restart)
  (setq pyim-default-scheme 'quanpin)
  ;;
  )

(defun pyim-toggle-wubi ()
  "`pyim-toggle-wubi` 切换至五笔输入法"
  (interactive)
  (pyim-restart)
  (setq pyim-default-scheme 'wubi)
  (pyim-wbdict-v98-enable))


;; eclim
;;(require 'eclim)
;;(add-hook 'java-mode-hook 'eclim-mode)
;;(require 'eclimd)

;;
;;(setq eclim-executable "~/workspace/toolkit/eclipse/eclim"
;;      eclim-eclipse-dirs "~/workspace/toolkit/eclipse"
;;      eclimd-executable "~/workspace/toolkit/eclipse/eclimd"
;;      eclimd-default-workspace "~/workspace/eclipse-workspace"
;;      eclimd-wait-for-process nil)


;; download related
;; (setq lsp-java-jdt-download-url "http://localhost:8000/jdt-language-server-latest.tar.gz")
;; (setq lsp-java--download-root "http://localhost:8000/lsp-java/install/")

(setq zeal-at-point-zeal-version "0.3.0")

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)

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
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)


(require 'dap-java)

(require 'cc-mode)

(use-package projectile :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)
(use-package lsp-java :ensure t :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(lsp-treemacs-sync-mode 1)

(use-package dap-java :after (lsp-java))


(define-key lsp-ui-mode-map
  [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map
  [remap xref-find-references] #'lsp-ui-peek-find-references)


(use-package lsp-treemacs
  :config
  (lsp-metals-treeview-enable t)
  (setq lsp-metals-treeview-show-when-views-received t))


;; local nginx
(setq dash-docs-docsets-url "http://localhost/feeds")
(setq dash-docs-browser-func 'eww)

;; racket-mode
(setq org-latex-compiler "xelatex")

(setq racket-program "/usr/bin/racket")

(setq inferior-lisp-program "ccl")

(setq slime-default-lisp 'ccl)
;;(require 'slime-autoloads)
(setq slime-contribs '(slime-fancy))
;;(setq inferior-lisp-program "/usr/local/src/ccl/lx86cl64")



(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("ctexartdocs"
                 "\\documentclass[UTF8,a4paper]{ctexart}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                 )))



(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("ctexartdocA5"
                 "\\documentclass[UTF8,a5paper]{ctexart}
                  \\usepackage[margin=0.5in]{geometry}
                  \\pagenumbering{gobble}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                 ))  )

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("ctexartdocsA4"
                 "\\documentclass[UTF8,a4paper]{ctexart}
                  \\usepackage[margin=0.5in]{geometry}
                  \\pagenumbering{gobble}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                 )))


;; erc
;;(setq socks-override-functions 1)
;;(setq socks-noproxy '("localhost"))
;;(require 'socks)

;;(setq erc-server-connect-function 'socks-open-network-stream)
;;(setq socks-server (list "My socks server" "127.0.0.1" 1080 5))


;;  workspace/*
;;
;;

(after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   `((R . t)
     (ditaa . t)
     (dot . t)
     (emacs-lisp . t)
     (gnuplot . t)
     (haskell . nil)
     (latex . t)
     (ledger . t)
     (ocaml . nil)
     (octave . t)
     (plantuml . t)
     (python . t)
     (ruby . t)
     (screen . nil)
     (,(if (locate-library "ob-sh") 'sh 'shell) . t)
     (makefile . t)
     (sql . t)
     (sqlite . t))))


(maybe-require-package 'latex-math-preview)
(after-load 'latex-math-preview
  (defun xserver-latex-math-preview ()
    "Execute COMMAND asynchronously,
display latex in X mingServer."
    (interactive)
    (let ((str (latex-math-preview-cut-mathematical-expression)))
      (if str
          (let ((dot-tex (latex-math-preview-make-temporary-tex-file str latex-math-preview-latex-template-header)))
            (setenv "DISPLAY" "localhost:10.0")
            (start-process "Display Latex Image" nil "display" (latex-math-preview-make-png-file dot-tex)))
        (message "Not in a TeX mathematical expression.")))))



(provide 'init-leosconfig)
;; init-leosconfig.el ends here
