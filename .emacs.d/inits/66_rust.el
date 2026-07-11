(add-to-list 'exec-path (expand-file-name "~/.cargo/bin"))

(use-package rust-mode
  :custom rust-format-on-save t)

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

;; (add-hook 'rust-mode-hook 'lsp)
