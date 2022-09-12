;;; custom-init.el --- init custom configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;proxy for install

;;(setq url-proxy-services
;;      '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
;;        ("http" . "leoproxyhost:7890")
;;        ("https" . "leoproxyhost:7890")))

;; use-package in future




(require 'custom-profile)
(require 'custom-org)
(require 'custom-ui)
(require 'custom-utils)
(require 'custom-lsp)
(require 'custom-coding-style)
(require 'custom-typescript)
;;(require 'custom-meghanada)
(require 'custom-cn)

(provide 'custom-init)
;;; custom-init.el ends here
