;;; go-mode --- go関連の設定

;;; Commentary:

;;; Code:

;; 必要なパッケージのロード
(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :hook
  (go-mode-hook . company-mode)
  (go-mode-hook . flycheck-mode)
  (go-mode-hook . go-eldoc-setup)
  (go-mode-hook . #'go-guru-hl-identifier-mode)
  (go-mode-hook . (lambda()
                    (setq gofmt-command "goimports")
                    (add-hook 'before-save-hook 'gofmt-before-save)
                    (local-set-key (kbd "M-.") 'godef-jump)
                    (local-set-key (kbd "M-,") 'pop-tag-mark)
                    (company-mode)
                                        ;(setq indent-tabs-mode nil)    ; タブを利用
                                        ;(setq c-basic-offset 2)        ; tabサイズを2にする
                    (setq tab-width 4)))
  )

;; 諸々の有効化、設定

(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                    :weight 'bold)


(provide '60_go)
;;; 60_go.el ends here
