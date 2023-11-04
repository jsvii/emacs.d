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

(when (and (display-graphic-p) (eq system-type 'gnu/linux))
  (cl-loop for font in '("JetBrains Mono" "Cascadia Code" "SF Mono" "Source Code Pro"
                         "Fira Code" "Menlo" "Monaco" "Dejavu Sans Mono"
                         "Lucida Console" "Consolas" "SAS Monospace" "Iosevka Nerd Font Mono" )
           when (font-installed-p font)
           return (set-face-attribute
                   'default nil
                   :font (font-spec :family font
                                    :weight 'normal
                                    :slant 'normal
                                    :size (cond ((eq system-type 'gnu/linux) 24)
                                                ((eq system-type 'windows-nt) 24)))))
  (cl-loop for font in '("OpenSansEmoji" "Noto Color Emoji" "Segoe UI Emoji"
                         "EmojiOne Color" "Apple Color Emoji" "Symbola" "Symbol")
           when (font-installed-p font)
           return (set-fontset-font t 'unicode
                                    (font-spec :family font
                                               :size (cond ((eq system-type 'gnu/linux) 24)
                                                           ((eq system-type 'windows-nt) 24)))
                                    nil 'prepend))
  (cl-loop for font in '("Sarasa Mono Slab SC" "思源黑体 CN" "思源宋体 CN" "微软雅黑 CN"
                         "Source Han Sans CN" "Source Han Serif CN"
                         "WenQuanYi Micro Hei" "文泉驿等宽微米黑"
                         "Microsoft Yahei UI" "Microsoft Yahei")
           when (font-installed-p font)
           return (set-fontset-font t '(#x4e00 . #x9fff)
                                    (font-spec :name font
                                               :weight 'normal
                                               :slant 'normal
                                               :size (cond ((eq system-type 'gnu/linux) 23)
                                                           ((eq system-type 'windows-nt) 23)))))
  (cl-loop for font in '("HanaMinB" "SimSun-ExtB")
           when (font-installed-p font)
           return (set-fontset-font t '(#x20000 . #x2A6DF)
                                    (font-spec :name font
                                               :weight 'normal
                                               :slant 'normal
                                               :size (cond ((eq system-type 'gnu/linux) 24)
                                                           ((eq system-type 'windows-nt) 24))))))


(provide 'custom-cn)
;;; custom-cn.el ends here
