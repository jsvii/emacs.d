;;; custom-profile.el --- emacs profile -*- lexical-binding: t -*-
;;; Commentary:
;;; 性能统计类
;;; Code:

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6
      file-name-handler-alist nil
      site-run-file nil)

(defvar leo/gc-cons-threshold (* 100 1024 1024))

(add-hook 'emacs-startup-hook      ; hook run after loading init files
          #'(lambda ()
              (setq gc-cons-threshold leo/gc-cons-threshold
                    gc-cons-percentage 0.1
                    file-name-handler-alist file-name-handler-alist-original)))
(add-hook 'minibuffer-setup-hook #'(lambda ()
                                     (setq gc-cons-threshold most-positive-fixnum)))
(add-hook 'minibuffer-exit-hook #'(lambda ()
                                    (garbage-collect)
                                    (setq gc-cons-threshold leo/gc-cons-threshold)))

(provide 'custom-profile)
;;; custom-profile.el ends here
