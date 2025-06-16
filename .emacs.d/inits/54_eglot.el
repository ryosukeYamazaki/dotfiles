(use-package eglot
  :ensure t
  :hook
  (ruby-mode . eglot-ensure)
  (web-mode . eglot-ensure)
  )
