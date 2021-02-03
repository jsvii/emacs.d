;;; custom-coding-style.el --- gui configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; sgml
;;
(setq sgml-basic-offset 4)
(setq js2-basic-offset 4)
(setq js-indent-level 4)

;; javascript
;;
(when (maybe-require-package 'undo-tree)
  (global-undo-tree-mode))

(when (maybe-require-package 'editorconfig)
  (editorconfig-mode 1))

(provide 'custom-coding-style)
;;; custom-coding-style.el ends here
