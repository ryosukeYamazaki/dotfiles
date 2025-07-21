;;; org-mode --- org mode, org-journalの設定

;;; Commentary:

;;; Code:

(use-package org-journal
  :ensure t
  :defer t  ; Emacs起動を高速化するため、必要になるまで読み込みを遅延
  :init
  :config
  ;; ジャーナルファイルを保存するディレクトリを指定
  (setq org-journal-dir "~/Documents/org/journal/")
  ;; ファイル名のフォーマットを指定（例: 2025-07-04.org）
  (setq org-journal-file-format "%Y-%m-%d.org")
  ;; 新しいファイルを作成した際のテンプレート
  (setq org-journal-new-entry-template
        (concat
         "#+title: %<%Y-%m-%d %A>\n\n" ; タイトルに日付と曜日を入れる
         "* Tasks\n\n"
         "* Notes\n\n"))
  :bind
  ;; おすすめのキーバインド（"C-c n j" -> note journal のような覚え方）
  ("C-c n j" . org-journal-new-entry))

(use-package org
  :ensure t
  :config
  (setq org-directory "~/Documents/org")
  (setq org-default-notes-file "notes.org")
  (setq org-capture-templates
        `(("j" "Journal Entry"; "j" がキャプチャのキー
           ;; ファイルの場所を org-journal の設定と動的に同期させる
           entry (file
                  (lambda ()
                    (expand-file-name ; パスを絶対パスに変換
                     (format-time-string org-journal-file-format) ; ファイル名を生成
                     org-journal-dir)) ; org-journalのディレクトリを指定(lambda () (format-time-string org-journal-file-format))
                  )
           "** \n:PROPERTIES:\n:CREATED: %T\n:END:\n%i\n %a" ; キャプチャする内容のテンプレート
           :empty-lines 1)))
  :bind
  (("C-c c" . org-capture))
  )

; Org-captureを呼び出すキーシーケンス
;; (define-key global-map "\C-cc" 'org-capture)

;; Org-mode で折返し設定を行うオプションの設定方法
(add-hook 'org-mode-hook #'visual-line-mode)

(setq org-log-done 'time)

(provide '10_org)

;;; 10_org.el ends here
