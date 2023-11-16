;;; custom-perspective.el -- perspective for multi projects ---*- lexical-binding: t -*-
;;; Commentary:
;;; perspective
;;; Code:
(use-package perspective
  :ensure t
  :custom
  (persp-mode-prefix-key (kbd "C-z"))
  (persp-state-default-file "~/.emacs.d/persistant/perspective-auto-save")
  :bind
  (("C-x k" . persp-kill-buffer*)
   ("C-x C-b" . persp-list-buffers)
   ("C-x b" . persp-switch-to-buffer*))
  :init
  (persp-mode)
  :hook
  ((kill-emacs . persp-state-save))
  )


(use-package treemacs-perspective
  :ensure t
  :after treemacs perspective
  :config
  (treemacs-set-scope-type 'Perspectives)
  )

(provide 'custom-perspective)
;;; custom-perspective.el ends here
