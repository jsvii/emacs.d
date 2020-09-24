;;; custom-lsp.el --- all lsp mode for development -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'lsp-mode)
(require-package 'lsp-ui)

(require 'lsp-ui)
(require 'lsp-ui-imenu)

(with-eval-after-load 'company
  (with-eval-after-load 'company-lsp)
  )

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
(require 'dap-chrome)





(provide 'custom-lsp)

;;; custom-lsp.el ends here
