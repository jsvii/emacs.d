;;; custom-dap-demo.el --- leos' customized config  -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;;
;; use-packages
;; helm
;;  -- gui

(require-package 'use-package)

(use-package lsp-ui
  :ensure t
  :after(lsp-mode)
  :commands lsp-ui-mode
  :config (progn
            ;; disable inline documentation
            (setq lsp-ui-sideline-enable nil)
            ;; disable showing docs on hover at the top of the window
            (setq lsp-ui-doc-enable nil)
            (setq lsp-ui-imenu-enable t)
            (setq lsp-ui-imenu-kind-position 'top))
  )

(use-package use-package-hydra
  :ensure t)

;; go hydra
(use-package hydra
  :ensure t
  :config
  (require 'hydra)
  (require 'dap-mode)
  (require 'dap-ui)
  ;;:commands (ace-flyspell-setup)
  :bind
  ;;("M-s" . hydra-go/body)
  :init
  (add-hook 'dap-stopped-hook
            (lambda (arg) (call-interactively #'hydra-go/body)))
  :hydra (hydra-go (:color pink :hint nil :foreign-keys run)
                   "
   _n_: Next       _c_: Continue _g_: goroutines      _i_: break log
   _s_: Step in    _o_: Step out _k_: break condition _h_: break hit condition
   _Q_: Disconnect _q_: quit     _l_: locals
   "
                   ("n" dap-next)
                   ("c" dap-continue)
                   ("s" dap-step-in)
                   ("o" dap-step-out)
                   ("g" dap-ui-sessions)
                   ("l" dap-ui-locals)
                   ("e" dap-eval-thing-at-point)
                   ("h" dap-breakpoint-hit-condition)
                   ("k" dap-breakpoint-condition)
                   ("i" dap-breakpoint-log-message)
                   ("q" nil "quit" :color blue)
                   ("Q" dap-disconnect :color red)))

;; DAP
(use-package dap-mode
  ;;:custom
  ;;(dap-go-debug-program `("node" "~/extension/out/src/debugAdapter/goDebug.js"))
  :config
  (dap-mode 1)
  (setq dap-print-io t)
  ;;(setq fit-window-to-buffer-horizontally t)
  ;;(setq window-resize-pixelwise t)
  (require 'dap-hydra)
  (require 'dap-go)		; download and expand vscode-go-extenstion to the =~/.extensions/go=
  ;;  (dap-go-setup)
  (require 'dap-node)
  (use-package dap-ui
    :ensure nil
    :config
    (dap-ui-mode 1)
    )
  )


(add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))

(provide 'custom-dap-demo)

;;; custom-dap-demo.el ends here
