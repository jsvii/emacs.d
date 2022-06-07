;;; custom-typescript.el --- all lsp mode for development -*- lexical-binding: t -*-
;;; Commentary:
;;; lsp & dap
;;; Code:

;; tide
(when (maybe-require-package 'tide)
  (progn
    (defun setup-tide-mode ()
      (interactive)
      (tide-setup)
      (flycheck-mode +1)
      (setq flycheck-check-syntax-automatically '(save mode-enabled))
      (eldoc-mode +1)
      (tide-hl-identifier-mode +1)
      ;; company is an optional dependency. You have to
      ;; install it separately via package-install
      ;; `M-x package-install [ret] company`
      (company-mode +1))
    (add-hook 'typescript-mode-hook #'setup-tide-mode)
    (add-hook 'before-save-hook 'tide-format-before-save)
    (add-hook 'web-mode-hook
              (lambda ()
                (when (string-equal "tsx" (file-name-extension buffer-file-name))
                  (setup-tide-mode))))
    (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
    ))

(provide 'custom-typescript)
;;; custom-typescript.el ends here
