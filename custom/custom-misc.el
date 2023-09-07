;;; custom-misc.el --- setting lisp mode -*- lexical-binding: t -*-
;;; Commentary:
;;; lisp coding
;;; Code:

(when (maybe-require-package 'undo-tree)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs/undo")))
  (global-undo-tree-mode)
  )


(provide 'custom-misc.el)
;;; custom-misc.el ends here
