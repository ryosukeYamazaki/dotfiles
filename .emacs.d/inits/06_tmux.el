;;; 06_tmux --- tmuxとの連携設定

;;; Commentary:

;;; Code:

(defun sync-kill-to-tmux-buffer (text)
  "TEXTの最新の内容をtmuxバッファに送る."
  ;; (interactive)
  ;; (message "Syncing to tmux: %s" (truncate-string-to-width text 30 nil nil "..."))
  (when (and kill-ring                    ; kill-ringが空でない
             (getenv "TMUX"))             ; tmuxセッション内で実行されている
    (let ((killed-text (current-kill 0 t))) ; 最新のkillされたテキストを取得
      (when (and killed-text (> (length killed-text) 0))
        (condition-case err
            (with-temp-buffer
              (insert killed-text)
              (shell-command-on-region (point-min) (point-max)
                                       "tmux load-buffer -"
                                       nil nil nil t))
          (error
           (message "Tmux buffer sync failed: %s" (error-message-string err))))))))

;; kill-hookでは呼ばれないことがあるので、interprogram-cut-functionに登録する
(setq interprogram-cut-function 'sync-kill-to-tmux-buffer)

(provide '06_tmux)
;;; 06_tmux.el ends here
