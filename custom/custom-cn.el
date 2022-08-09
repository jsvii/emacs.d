;;; custom-cn.el --- chinese environment -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;; not WSL, ssh client, macos
;; WSL: WSL1 has "-Microsoft", WSL2 has "-microsoft-standard"

(when (and (not (getenv "SSH_CLIENT"))
           (not (string-match "-[Mm]icrosoft" operating-system-release))
           (not (eq system-type 'darwin)))
  (when (maybe-require-package 'rime)
    (setq rime-show-candidate 'popup)
    (setq default-input-method 'rime)
    ))


(set-face-attribute 'default nil :font (font-spec :family "JetBrains Mono" :size 24))
(set-fontset-font t 'unicode (font-spec :family "Noto Color Emoji" :size 24))
(set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "Sarasa Mono Slab SC" :size 24 ))



(provide 'custom-cn)
;;; custom-cn.el ends here
