;;; org-mode --- config
(setq org-directory "~/Documents/org")
;(setq org-directory "~/Dropbox/Org")
(setq org-default-notes-file "notes.org")
; Org-captureの設定

; Org-captureを呼び出すキーシーケンス
(define-key global-map "\C-cc" 'org-capture)
                                        ; Org-captureのテンプレート（メニュー）の設定
(setq org-capture-templates
        `(("j" "Journal Entry" entry ; "j" がキャプチャのキー
           ;; ファイルの場所を org-journal の設定と動的に同期させる
           (file+datetree (lambda () (format-time-string org-journal-file-format)) "Notes")
           "* %?\n  %i" ; キャプチャする内容のテンプレート
           :empty-lines-before 1
           :empty-lines-after 1)))

(setq org-log-done 'time)

(use-package org-journal
  :ensure t
  :defer t  ; Emacs起動を高速化するため、必要になるまで読み込みを遅延
  :init
  ;; ジャーナルファイルを保存するディレクトリを指定
  (setq org-journal-dir "~/org/journal/")
  ;; ファイル名のフォーマットを指定（例: 2025-07-04.org）
  (setq org-journal-file-format "%Y-%m-%d.org")
  ;; 新しいファイルを作成した際のテンプレート
  (setq org-journal-new-entry-template
        (string
         "#+title: %<%Y-%m-%d %A>\n\n" ; タイトルに日付と曜日を入れる
         "* Tasks\n\n"
         "* Notes\n\n"))

  :bind
  ;; おすすめのキーバインド（"C-c n j" -> note journal のような覚え方）
  ("C-c n j" . org-journal-new-entry))

