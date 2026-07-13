;; projectileの設定
(use-package projectile
  :init
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (setq projectile-completion-system 'ivy))

;; ivy-projectile
(use-package counsel-projectile
  :after projectile
  :config
  (counsel-projectile-mode 1))

(use-package treemacs-projectile
  :after (treemacs projectile))
