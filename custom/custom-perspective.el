;;; custom-perspective.el -- perspective for multi projects ---*- lexical-binding: t -*-
;;; Commentary:
;;; perspective
;;; Code:

(use-package perspective
  :ensure t
  :config
  (setq persp-state-default-file "~/.emacs.d/persistant/perspective-auto-save")
  (persp-mode)
  :custom (persp-mode-prefix-key (kbd "C-z"))
  :bind (
         ("C-x k" . persp-kill-buffer*)
         ("C-x C-b" . persp-list-buffers))
  :hook ((kill-emacs . persp-state-save))
  )

;; ("C-x b" . persp-switch-to-buffer*)

(use-package treemacs-perspective
  :ensure t
  :after treemacs perspective
  :config (treemacs-set-scope-type 'Perspectives)
  )



(provide 'custom-perspective)
;;; custom-perspective.el ends here
