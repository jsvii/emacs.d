;;; custom-lsp.el --- all lsp mode for development -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'lsp-treemacs)
(require-package 'hydra)
(require-package 'helm-lsp)


;; disable inline documentation
(setq lsp-ui-sideline-enable t)
;; disable showing docs on hover at the top of the window
(setq lsp-ui-doc-enable nil)
(setq lsp-ui-imenu-enable t)
(setq lsp-ui-imenu-kind-position 'top)
(setq lsp-treemacs-sync-mode t)

(with-eval-after-load 'company
  (with-eval-after-load 'company-lsp)
  )

(require 'lsp-ui)
(require 'lsp-ui-imenu)
;;(require 'lsp-treemacs)
(require 'helm-lsp)


(with-eval-after-load 'lsp-ui
  (progn
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
    (setq lsp-ui-sideline-enable t)
    (setq lsp-ui-doc-enable t)
    (setq lsp-ui-peek-enable t)
    (setq lsp-ui-peek-always-show t)
    )
  )

(require-package 'dap-mode)

(with-eval-after-load 'dap-mode
  (progn
    (require 'dap-chrome)
    (require 'dap-node)
    (require 'dap-ui)
    (setq dap-print-io t)
    (dap-mode t)
    (dap-ui-mode t)
    )
  )

(setq dap-auto-configure-features '(sessions locals controls tooltip))

(provide 'custom-lsp)

;;; custom-lsp.el ends here
