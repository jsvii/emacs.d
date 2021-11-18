;;; custom-java.el --- all lsp mode for development -*- lexical-binding: t -*-
;;; Commentary:
;;; java coding
;;; Code:

(setenv "JAVA_HOME"  "/home/leo/.bin/.bin/jdk1.8.0_281")
(setq lsp-java-java-path "/home/leo/.bin/.bin/jdk1.8.0_281/bin/java")


;;      (when (maybe-require-package 'meghanada)
;;        (progn
;;          (add-hook 'java-mode-hook
;;                    (lambda ()
;;                      ;; meghanada-mode on
;;                      (meghanada-mode t)
;;                      (flycheck-mode +1)
;;                      (setq c-basic-offset 2)
;;                      ;; use code format
;;                      (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
;;          ))






;;; custom-java.el ends here
