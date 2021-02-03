;;; custom-lsp-dap.el --- all lsp mode for development -*- lexical-binding: t -*-
;;; Commentary:
;;; lsp & dap
;;; Code:
(when (maybe-require-package 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (maybe-require-package 'flycheck)
  (with-eval-after-load 'flycheck
    (flycheck-add-mode 'typescript-tslint 'web-mode)
    ))
;;;
;;;;;;;; javascript & typescript
;;; npm i -g javascript-typescript-langserver
;;; npm i -g typescript-language-server; npm i -g typescript
;;;;;;;; css
;;; npm install -g vscode-css-languageserver-bin
;;;
(when (maybe-require-package 'lsp-mode)
  ;; lsp-ui
  (maybe-require-package 'lsp-ui)
  (maybe-require-package 'lsp-treemacs)
;;  (maybe-require-package 'lsp-java)
  (dolist (hook
           '(c-mode-hook
             c++-mode-hook
             c-or-c++-mode-hook
             ;;java-mode-hook
             js-mode-hook
             js-jsx-mode-hook
             js2-mode-hook
             css-mode-hook
             typescript-mode-hook
             python-mode-hook
             web-mode-hook))
    (add-hook hook #'lsp))
  )

(with-eval-after-load 'ivy
  (maybe-require-package 'lsp-ivy))

(with-eval-after-load 'company
  (maybe-require-package 'company-lsp))

(with-eval-after-load 'lsp-treemacs
  (setq lsp-treemacs-sync-mode t)
  )

;;  (add-to-list 'lsp-language-id-configuration '(js-jsx-mode . "javascriptreact"))
;;(add-hook 'web-mode-hook #'lsp-flycheck-enable) ; enable flycheck-lsp for web-mode locally
(with-eval-after-load 'lsp-mode
  ;; lsp configs
  (setq lsp-auto-guess-root t)
  (setq lsp-diagnostic-package :none)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-enable-folding nil)
  (setq lsp-enable-imenu nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-enable-completion-at-point nil)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-idle-delay 0.5)
  (setq lsp-prefer-capf t))

(with-eval-after-load 'lsp-ui
  (progn
    (require 'lsp-ui-imenu)
    (setq lsp-ui-sideline-enable t)
    ;; disable showing docs on hover at the top of the window
    (setq lsp-ui-doc-enable nil)
    (setq lsp-ui-imenu-enable t)
    (setq lsp-ui-imenu-kind-position 'top)
    (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
    (define-key lsp-ui-mode-map (kbd "C-c C-l .") 'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map (kbd "C-c C-l ?") 'lsp-ui-peek-find-references)
    (define-key lsp-ui-mode-map (kbd "C-c C-l r") 'lsp-rename)
    (define-key lsp-ui-mode-map (kbd "C-c C-l x") 'lsp-restart-workspace)
    (define-key lsp-ui-mode-map (kbd "C-c C-l w") 'lsp-ui-peek-find-workspace-symbol)
    (define-key lsp-ui-mode-map (kbd "C-c C-l i") 'lsp-ui-peek-find-implementation)
    (define-key lsp-ui-mode-map (kbd "C-c C-l d") 'lsp-describe-thing-at-point)
    (define-key lsp-ui-mode-map (kbd "C-c C-l e") 'lsp-execute-code-action)
    ))

;;; lsp-java
(setq lsp-java-jdt-download-url "http://api.doc/jdt-language-server-latest.tar.gz")
(setq lsp-java--download-root "http://api.doc/lsp-java/install/")
(setq lsp-java-java-path "/home/leo/.sdkman/candidates/java/11.0.2-open/bin/java")
(setq lsp-java-maven-download-sources t)


;;;; dap
(require-package 'dap-mode)

(with-eval-after-load 'dap-mode
;;  (require 'dap-java)
  (progn
    (require 'dap-chrome)
    (require 'dap-node)
    (require 'dap-ui)
    (setq dap-print-io t)
    (dap-mode t)
    (dap-ui-mode t)
    ))

(setq dap-auto-configure-features '(sessions locals controls tooltip))


(provide 'custom-lsp-dap)
;;; custom-lsp-dap.el ends here
