;;; custom-cn.el --- chinese environment -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; https://github.com/DogLooksGood/emacs-rime
;; https://github.com/rime/librime
(when (require-package 'rime)
  (if (eq system-type 'darwin) (setq rime-librime-root "~/.emacs.d/librime/dist"))
  (setq rime-show-candidate 'popup)
  (setq default-input-method 'rime)
  (require 'rime)
  )

(when
    (display-graphic-p)
  (let
      ((font-installed-p
        (lambda (font-name)
          (find-font (font-spec :name font-name))
          ))
       (default-font-list
        '("JetBrains Mono" "Source Code Pro" "Cascadia Code" "SF Mono"
          "Fira Code" "Menlo" "Monaco" "Dejavu Sans Mono"
          "Lucida Console" "Consolas" "SAS Monospace" "Iosevka Nerd Font Mono" ))
       (unicode-font-list
        '("Hack Nerd Font Mono" "OpenSansEmoji" "Noto Color Emoji" "Segoe UI Emoji"
          "EmojiOne Color" "Apple Color Emoji" "Symbola" "Symbol"))
       (han-font-list
        '("Sarasa Mono Slab SC" "思源黑体 CN" "思源宋体 CN"
          "Source Han Sans CN" "Source Han Serif CN"
          "WenQuanYi Micro Hei" "文泉驿等宽微米黑"
          "Microsoft Yahei UI" "Microsoft Yahei")
        )
       (font-size-normal
        (cond
         ((eq system-type 'gnu/linux) 20)
         ((eq system-type 'darwin) 20)
         )
        )
       )
    (progn
      (cl-loop for font in default-font-list
               when (funcall font-installed-p font)
               return (set-face-attribute
                       'default nil
                       :font (font-spec :family font
                                        :weight 'normal
                                        :slant 'normal
                                        :size font-size-normal)))
      (cl-loop for font in unicode-font-list
               when (funcall font-installed-p font)
               return (set-fontset-font t 'unicode
                                        (font-spec :family font
                                                   :size font-size-normal
                                                   nil 'prepend)))
      (cl-loop for font in han-font-list
               when (funcall font-installed-p font)
               return (set-fontset-font t 'han
                                        (font-spec :name font
                                                   :weight 'normal
                                                   :slant 'normal
                                                   :size font-size-normal)))
      )))

(provide 'custom-cn)
;;; custom-cn.el ends here
