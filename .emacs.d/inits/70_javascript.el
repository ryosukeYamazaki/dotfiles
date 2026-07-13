(use-package js
  :ensure nil
  :mode (("\\.cjs\\'" . js-ts-mode)
         ("\\.js\\'" . js-ts-mode)
         ("\\.mjs\\'" . js-ts-mode))
  :hook (js-ts-mode . copilot-mode)
  :config
  (setq js-indent-level 2))
