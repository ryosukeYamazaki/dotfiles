(use-package lsp-mode
  :ensure t
  )
(use-package lsp-ui
  :ensure t
  :hook
  (lsp-mode . lsp-ui-mode)
  )
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1))))

(setq lsp-headerline-breadcrumb-mode t)
(setq lsp-headerline-breadcrumb-enable-symbol-numbers t)
(use-package hydra :ensure t)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list :ensure t)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1)))
  )
(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t)
  :custom
  (dap-auto-configure-features '(sessions locals breakpoints expressions repl controls tooltip))
  )
