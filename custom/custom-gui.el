;;; custom-gui.el --- gui configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(if (display-graphic-p)
    (progn
      (set-face-attribute 'default nil :height 200)))

(provide 'custom-gui)
;;; custom-gui.el ends here
