;;; custom-init.el --- init custom configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; use-package in future


(require 'custom-profile)
(require 'custom-cn)
(require 'custom-org)
(require 'custom-ui)
(require 'custom-utils)
(require 'custom-lsp)
(require 'custom-coding-style)
(require 'custom-typescript)

(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

(provide 'custom-init)
;;; custom-init.el ends here
