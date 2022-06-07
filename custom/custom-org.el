;;; custom-org.el --- org mode customes -*- lexical-binding: t -*-
;;; Commentary:
;;; org 设置
;;; Code:

(require-package 'org)
(require 'ox-latex)
(add-hook 'org-mode-hook
          #'(lambda ()
              ;; make the lines in the buffer wrap around the edges of the screen.
              ;; to press C-c q  or fill-paragraph ever again!
              (visual-line-mode)
              ;;(org-indent-mode)
              ))

(global-set-key (kbd "C-c c")   'org-capture)


(setq org-habit-show-done-always-green t)
(setq org-default-notes-file "/home/leo/workspace/leo/betterLife/log/inbox/todo.org")
(setq org-capture-templates
      `(("t" "task" entry (file "/home/leo/workspace/leo/betterLife/log/inbox/todo.org")
         "* TODO %?\nCaptured %<%Y-%m-%d %H:%M>")
        ("n" "note" entry (file "/home/leo/workspace/leo/betterLife/log/inbox/note.org")
         "* Note %<%Y-%m-%d %H:%M>\n%?")))

;; agenda
(require 'appt)
(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt)
(appt-activate 1)
(setq appt-message-warning-time 15)

(setq org-agenda-ndays 30)
(setq org-agenda-files
      '(
        "~/workspace/leo/betterLife/log/inbox/todo.org"
        "~/workspace/leo/betterLife/log/inbox/note.org"
        "~/workspace/leo/betterLife/log/inbox/project.org"
        "~/workspace/leo/betterLife/log/inbox/habit.org"))

(setq org-columns-default-format "%50ITEM(Task) %10CLOCKSUM %16TIMESTAMP_IA")




;;;;;;;;;;;;;;;;;;;;;;;;; latex
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("ctexartdocs"
                 "\\documentclass[UTF8,a4paper]{ctexart}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                 ))
  (add-to-list 'org-latex-classes
               '("ctexartdocA5"
                 "\\documentclass[UTF8,a5paper]{ctexart}
                  \\usepackage[margin=0.5in]{geometry}
                  \\pagenumbering{gobble}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                 ))
  (add-to-list 'org-latex-classes
               '("ctexartdocsA4"
                 "\\documentclass[UTF8,a4paper]{ctexart}
                  \\usepackage[margin=0.5in]{geometry}
                  \\pagenumbering{gobble}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                 ))
  )

;; org
(maybe-require-package 'latex-math-preview)
(with-eval-after-load 'latex-math-preview
  (defun xserver-latex-math-preview ()
    "Execute COMMAND asynchronously,
display latex in X mingServer."
    (interactive)
    (let ((str (latex-math-preview-cut-mathematical-expression)))
      (if str
          (let ((dot-tex (latex-math-preview-make-temporary-tex-file str latex-math-preview-latex-template-header)))
            (setenv "DISPLAY" "localhost:10.0")
            (start-process "Display Latex Image" nil "display" (latex-math-preview-make-png-file dot-tex)))
        (message "Not in a TeX mathematical expression.")))))

(provide 'custom-org)
;;; custom-org.el ends here
