;;; 04_remote_clipboard_sync.el --- remoteのclipboard共有の設定

;;; Commentary:

;;; Code:

(defun copy-to-local-clipboard ()
  "Kill-ringの先頭の内容を、一時バッファを経由してローカルのクリップボードにコピーする。"
  (interactive)
  (if (car kill-ring)
      ;; with-temp-bufferマクロを使い、一時的なバッファで処理を実行
      (with-temp-buffer
        ;; 1. kill-ringの先頭の内容を一時バッファに挿入
        (insert (car kill-ring))
        ;; 2. バッファ全体をリージョンとしてncコマンドに送信する
        (call-process-region
         (point-min) ; バッファの先頭から
         (point-max) ; バッファの末尾までを
         "nc"        ; ncコマンドに
         nil         ; 出力は破棄
         nil         ; 出力バッファなし
         nil         ; エラー表示しない
         "-N"        ; 送信後に接続を閉じる
         "localhost"
         "8888")
        ;; 3. 成功メッセージを表示
        (message "クリップボードにコピーしました。"))
    (message "kill-ringは空です。")))

;; キーバインドをこちらの最終版の関数に設定します
(global-set-key (kbd "C-c y") 'copy-to-local-clipboard)

(provide '04_remote_clipboard_sync)

;;; 04_remote_clipboard_sync.el ends here
