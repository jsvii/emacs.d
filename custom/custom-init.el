;;; custom-init.el --- init custom configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; use-package in future
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'custom-profile)
(require 'custom-cn)
(require 'custom-org)
(require 'custom-ui)
(require 'custom-utils)
(require 'custom-lsp)
(require 'custom-dap)
(require 'custom-coding-style)

(provide 'custom-init)
;;; custom-init.el ends here
