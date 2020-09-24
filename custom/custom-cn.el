;;; custom-cn.el --- chinese environment -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(maybe-require-package 'rime)

(setq rime-show-candidate 'popup)
(setq default-input-method 'rime)

(provide 'custom-cn)
;;; custom-cn.el ends here
