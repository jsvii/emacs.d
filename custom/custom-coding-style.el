;;; custom-coding-style.el --- gui configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; sgml
;;
(setq sgml-basic-offset 4)

;; javascript
;;
(when (maybe-require-package 'undo-tree)
  (global-undo-tree-mode))

(provide 'custom-coding-style)
;;; custom-coding-style.el ends here
