;;; tsx-ts-mode --- typescript関連の設定

;;; Commentary:

;;; Code:

(defun ry/typescript-project-config-exists-p ()
  (or (locate-dominating-file default-directory "tsconfig.json")
      (locate-dominating-file default-directory "jsconfig.json")))

(use-package typescript-ts-mode
  :mode (("\\.tsx\\'" . tsx-ts-mode)
         ("\\.ts\\'" . typescript-ts-mode))
  :hook
  ((typescript-ts-mode . copilot-mode)
   (tsx-ts-mode . copilot-mode))
  :config
  (setq typescript-ts-mode-indent-offset 2))

(use-package tide
  :hook (tsx-ts-mode . ry/setup-tide-mode)
  :config
  (defun ry/setup-tide-mode ()
    (interactive)
    (when (ry/typescript-project-config-exists-p)
      (tide-setup)
      (flycheck-mode +1)
      (setq flycheck-check-syntax-automatically '(save mode-enabled))
      (eldoc-mode +1)
      (tide-hl-identifier-mode +1)
      (company-mode +1)))
  (setq company-tooltip-align-annotations t))

;; (add-to-list 'auto-mode-alist '("\\.tsx?\\" . copliot))

;; (provide '71_typescript)
;;; 71_typescript.el ends here
