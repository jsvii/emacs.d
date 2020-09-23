;;; init-leosconfig.el --- leos' customized config  -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;;
;; use-packages
;; helm
;;  -- gui

;; packages


(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))

(setq debug-on-error t)

(setq package-check-signature nil)

;;(setq multi-term-program "/bin/zsh")

(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|127.*\\|mysuse\\)")
        ("http" . "localhost:8118")
        ("https" . "localhost:8118")))

(require 'dash-docs)


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

;;(require 'dap-java)

;;(require 'cc-mode)

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
