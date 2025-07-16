;;; package --- 日本語入力の設定

;;; Commentary:

;;; Code:

(use-package mozc
  :commands mozc
  :ensure t
  )
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(prefer-coding-system 'utf-8)

(provide '30_japanes)

;;; 30_japanes.el ends here
