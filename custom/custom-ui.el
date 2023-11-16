;;; custom-ui.el --- gui configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(global-hl-line-mode +1)

;; themes
;; https://emacsthemes.com/popular/index.html
;;
(dolist
    (emacs-theme
     '(
       zenburn-theme
       solarized-theme
       monokai-theme
       gruvbox-theme
       material-theme
       ample-theme
       jazz-theme
       ))
  (maybe-require-package emacs-theme))

(setq-default custom-enabled-themes
              '(sanityinc-tomorrow-eighties
                gruvbox-dark-medium))

(add-to-list 'auto-mode-alist '("\\.svg\\'" . image-mode))

(provide 'custom-ui)

;;; custom-ui.el ends here
