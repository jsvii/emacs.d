;;; custom-dap.el --- debug adapter protocol -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


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

(provide 'custom-dap)
;;; custom-dap.el ends here
