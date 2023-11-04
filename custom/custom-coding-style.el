;;; custom-coding-style.el --- gui configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; hide windows eol
(defun custom-remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;;
;;
(defun custom-codingstyle2 ()
  "Coding style use 2 space indient."
  (interactive)
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-basic-offset 2)
  (setq js-indent-level 2)
  (setq typescript-indent-level 2)
  (setq sgml-basic-offset 2)
  (setq css-indent-offset 2)
  )

(defun custom-codingstyle4 ()
  "Coding style use 4 space indient."
  (interactive)
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-basic-offset 4)
  (setq js-indent-level 4)
  (setq typescript-indent-level 4)
  (setq sgml-basic-offset 4)
  (setq css-indent-offset 4)
  )

(custom-codingstyle4)

;;(add-hook 'find-file-hook 'custom-remove-dos-eol)


(defun node-repl ()
  "start a node.js repl"
  (interactive)
  (setenv "NODE_NO_READLINE" "1") ;avoid fancy terminal codes
  (pop-to-buffer (make-comint "node-repl" "node" nil "--interactive")))


;; javascript
;;
(when (maybe-require-package 'editorconfig)
  (with-eval-after-load 'editorconfig
    (editorconfig-mode 1))
  )

(when (maybe-require-package 'prettier)
  (progn
    (add-hook 'web-mode-hook #'prettier-js-mode)
    (add-hook 'js2-mode-hook 'prettier-js-mode)
    (add-hook 'typescript-mode-hook 'prettier-js-mode)
    ))

(provide 'custom-coding-style)
;;; custom-coding-style.el ends here
