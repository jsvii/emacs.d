;;; custom-lsp.el --- all lsp mode for development -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (with-eval-after-load 'flycheck
    (flycheck-add-mode 'typescript-tslint 'web-mode)
    )
  )


;;;
;;; npm i -g javascript-typescript-langserver
;;; npm i -g typescript-language-server; npm i -g typescript
;;;
(when (maybe-require-package 'lsp-mode)
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
  (setq lsp-prefer-capf t)

  ;;  (add-to-list 'lsp-language-id-configuration '(js-jsx-mode . "javascriptreact"))
  ;;(add-hook 'web-mode-hook #'lsp-flycheck-enable) ; enable flycheck-lsp for web-mode locally
  (with-eval-after-load 'lsp-mode
    (dolist (hook
             '(c-mode-hook
               c++-mode-hook
               c-or-c++-mode-hook
               java-mode-hook
               js-mode-hook
               js-jsx-mode-hook
               js2-mode-hook
               typescript-mode-hook
               python-mode-hook
               web-mode-hook))
      (add-hook hook #'lsp))
    ;;    (require 'lsp-javascript)
    )

  ;; lsp-ui
  (when (maybe-require-package 'lsp-ui)
    (setq lsp-ui-sideline-enable t)
    ;; disable showing docs on hover at the top of the window
    (setq lsp-ui-doc-enable nil)
    (setq lsp-ui-imenu-enable t)
    (setq lsp-ui-imenu-kind-position 'top)
    (with-eval-after-load 'lsp-ui
      (progn
        (require 'lsp-ui-imenu)
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
        )
      )
    )
  (when (maybe-require-package 'lsp-treemacs)
    (setq lsp-treemacs-sync-mode t))

  (with-eval-after-load 'ivy
    (maybe-require-package 'lsp-ivy))

  (with-eval-after-load 'company
    (maybe-require-package 'company-lsp))
  )

(provide 'custom-lsp)
;;; custom-lsp.el ends here
