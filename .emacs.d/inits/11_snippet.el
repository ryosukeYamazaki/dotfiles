;;; 11_snipet --- yasnippetの設定

;;; Commentary:

;; yasnippetの package install方法や設定を記載します。

;;; Code:

(use-package yasnippet
  :ensure t
  :config
  ;; スニペットが格納されているディレクトリを指定
  ;; yasnippet-snippets パッケージも利用する場合は、以下のように両方のパスを追加します
  ;; (setq yas-snippet-dirs
  ;;       '("~/.emacs.d/snippets" ;; 自作スニペット用
  ;;         (expand-file-name "snippets" (expand-file-name "yasnippet-snippets" user-emacs-directory))))
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1)
  :bind
  ;; キーバインドを設定
  ("C-x y i" . yas-insert-snippet)
  ("C-x y n" . yas-new-snippet)
  ("C-x y v" . yas-visit-snippet-file))

(provide '11_snippet)

;;; 11_snippet.el ends here
