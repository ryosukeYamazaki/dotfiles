;;; tsx-ts-mode --- typescript関連の設定

;;; Commentary:

;;; Code:

(use-package typescript-ts-mode
  :mode (("\\.tsx?\\'" . tsx-ts-mode)
         ("\\.ts?\\'" . tsx-ts-mode))
  :hook
  (tsx-ts-mode-hook . 'copilot-mode)
  :config
  (setq typescript-ts-mode-indent-offset 2))

(use-package tide
  :ensure t
  :hook (tsx-ts-mode . setup-tide-mode)
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1))
  (setq company-tooltip-align-annotations t))

;; (add-to-list 'auto-mode-alist '("\\.tsx?\\" . copliot))

;; (provide '71_typescript)
;;; 71_typescript.el ends here
