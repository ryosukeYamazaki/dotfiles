;;; markdown-mode --- markdown関連の設定

;;; Commentary:

;;; Code:

(use-package markdown-mode
  :init
  :bind
  (("<Tab>" . markdown-cycle)
   ("<S-tab>" . markdown-shifttab)
   ("C-M-n" . outline-next-visible-heading)
   ("C-M-p" . outline-previous-visible-heading)))


(provide '12_markdown)

;;; 12_markdown.el ends here
