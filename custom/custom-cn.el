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

;;; font for linux desktop
(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))
(when
    (display-graphic-p)
  (let (
        (default-font-list
         (cond
          ((eq system-type 'gnu/linux)
           '("JetBrains Mono" "Cascadia Code" "SF Mono" "Source Code Pro"
             "Fira Code" "Menlo" "Monaco" "Dejavu Sans Mono"
             "Lucida Console" "Consolas" "SAS Monospace" "Iosevka Nerd Font Mono" ))
          ((eq system-type 'darwin)
           '("JetBrains Mono" "Cascadia Code" "SF Mono" "Source Code Pro"
             "Fira Code" "Menlo" "Monaco" "Dejavu Sans Mono"
             "Lucida Console" "Consolas" "SAS Monospace" "Iosevka Nerd Font Mono" )
           )
          ))
        (unicode-font-list
         (cond
          ((eq system-type 'gnu/linux)
           '("Hack Nerd Font Mono" "OpenSansEmoji" "Noto Color Emoji" "Segoe UI Emoji"
             "EmojiOne Color" "Apple Color Emoji" "Symbola" "Symbol")
           )
          ((eq system-type 'darwin)
           '("Hack Nerd Font Mono"))
          ))
        (chinese-font-list
         (cond
          ((eq system-type 'gnu/linux)
           '("Sarasa Mono Slab SC" "思源黑体 CN" "思源宋体 CN"
             "Source Han Sans CN" "Source Han Serif CN"
             "WenQuanYi Micro Hei" "文泉驿等宽微米黑"
             "Microsoft Yahei UI" "Microsoft Yahei")
           )
          ((eq system-type 'darwin)
           '("PingFang SC"))
          )
         )
        (other-font-list
         '("HanaMinB" "SimSun-ExtB")
         )
        (font-size-normal
         (cond
          ((eq system-type 'gnu/linux) 26)
          ((eq system-type 'darwin) 24)
          )
         )
        )
    (progn
      (cl-loop for font in default-font-list
               when (font-installed-p font)
               return (set-face-attribute
                       'default nil
                       :font (font-spec :family font
                                        :weight 'normal
                                        :slant 'normal
                                        :size font-size-normal)))
      (cl-loop for font in unicode-font-list
               when (font-installed-p font)
               return (set-fontset-font t 'unicode
                                        (font-spec :family font
                                                   :size font-size-normal
                                                   nil 'prepend)))
      (cl-loop for font in chinese-font-list
               when (font-installed-p font)
               return (set-fontset-font t '(#x4e00 . #x9fff)
                                        (font-spec :name font
                                                   :weight 'normal
                                                   :slant 'normal
                                                   :size font-size-normal)))
      (cl-loop for font in other-font-list
               when (font-installed-p font)
               return (set-fontset-font t '(#x20000 . #x2A6DF)
                                        (font-spec :name font
                                                   :weight 'normal
                                                   :slant 'normal
                                                   :size font-size-normal))))))

(provide 'custom-cn)
;;; custom-cn.el ends here
