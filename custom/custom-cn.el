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

(provide 'custom-cn)
;;; custom-cn.el ends here
