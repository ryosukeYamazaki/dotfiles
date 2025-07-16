;;; package --- eglotの設定

;;; Commentary:

;;; Code:

(use-package eglot
  :ensure t
  :hook
  (ruby-mode . eglot-ensure)
  (web-mode . eglot-ensure)
  (go-mode . eglot-ensure)
  )

(provide '54_eglot)
;;; 54_eglot.el ends here
