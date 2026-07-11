;;; tree-sitter --- tree-sitter関連の設定

;;; Commentary:

;;; Code:

(require 'treesit)

(setq treesit-font-lock-level 4)
(add-to-list 'treesit-extra-load-path
             (expand-file-name "tree-sitter" user-emacs-directory))
(dolist (grammar
         '((tsx "https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src")
           (typescript "https://github.com/tree-sitter/tree-sitter-typescript" nil "typescript/src")))
  (add-to-list 'treesit-language-source-alist grammar))

(use-package treesit-auto
  :init
  (require 'treesit-auto)
  (global-treesit-auto-mode)
  :config
  (setq treesit-auto-install 'prompt))

(provide '51_treesit)
;;; 51_treesit.el ends here
