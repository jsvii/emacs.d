;;; custom-cn.el --- chinese environment -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WSL: WSL1 has "-Microsoft", WSL2 has "-microsoft-standard"
(when (and
       (not (string-match "-[Mm]icrosoft" operating-system-release))
       (not (eq system-type 'darwin)))
  (maybe-require-package 'rime)
  (setq rime-show-candidate 'popup)
  (setq default-input-method 'rime))

(provide 'custom-cn)
;;; custom-cn.el ends here
