;;; custom-ui.el --- gui configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(if (display-graphic-p)
    (progn
      (set-face-attribute 'default nil :height 200)))

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
       material-theme
       ample-theme
       jazz-theme
       ))
  (maybe-require-package emacs-theme))

(setq-default custom-enabled-themes
              '(sanityinc-tomorrow-eighties                ))

(provide 'custom-ui)
;;; custom-ui.el ends here
