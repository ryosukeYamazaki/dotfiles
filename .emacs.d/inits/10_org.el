;;; org-mode --- org mode, org-journalの設定

;;; Commentary:

;;; Code:

;; (use-package org-journal
;;   :ensure t
;;   :defer t  ; Emacs起動を高速化するため、必要になるまで読み込みを遅延
;;   :init
;;   :config
;;   ;; ジャーナルファイルを保存するディレクトリを指定
;;   (setq org-journal-dir "~/Documents/org/journal/")
;;   ;; ファイル名のフォーマットを指定（例: 2025-07-04.org）
;;   (setq org-journal-file-format "%Y-%m-%d.org")
;;   ;; 新しいファイルを作成した際のテンプレート
;;   (setq org-journal-new-entry-template
;;         (concat
;;          "#+title: %<%Y-%m-%d %A>\n\n" ; タイトルに日付と曜日を入れる
;;          "* Tasks\n\n"
;;          "* Notes\n\n"))
;;   :bind
;;   ;; おすすめのキーバインド（"C-c n j" -> note journal のような覚え方）
;;   ("C-c n j" . org-journal-new-entry))

(use-package org
  :ensure t
  :config
  (setq org-directory "~/Documents/riverside-atelier/content")
  (setq org-default-notes-file "notes.org")
  :bind
  (("C-c c" . org-capture))
  )

(use-package org-roam
   :ensure t
   :init
   (setq org-roam-v2-ack t) ; v2を利用する場合
   :custom
   (org-roam-directory
    (file-truename "~/Documents/riverside-atelier/content"))
   (org-roam-db-location
    (file-truename "~/Documents/riverside-atelier/content/org-roam.db"))
   :config
   ;; Org-roam本体の有効化
   (org-roam-setup)
   ;; Dailies機能（日記機能）の設定
   (require 'org-roam-dailies)
   (setq org-roam-dailies-directory "sketches/dailies/")
   (setq org-roam-capture-templates
         '(("d" "default" plain "%?"
            :target (file+head "sketches/nodes/%<%Y%m%d%H%M%S>-${slug}.org" ; ← "nodes/" を追加
                               "#+EXPORT_HUGO_PRIVATE: t\n#+AUTHOR: moai\n#+title: ${title}\n#+HUGO_SECTION: sketches\n#+HUGO_AUTO_SET_LASTMOD: t\n"))))
   (setq org-roam-dailies-capture-templates
         `(("d" "default" entry "* %?"
            :target (file+head "%<%Y-%m-%d>.org"
                               "#+EXPORT_HUGO_PRIVATE: t\n#+AUTHOR: moai\n#+title: %<%Y-%m-%d>\n#+HUGO_SECTION: sketches\n#+HUGO_AUTO_SET_LASTMOD: t\n"))))
   ;; ショートカットキーの設定例
   :bind (("C-c n l" . org-roam-buffer-toggle)
          ("C-c n f" . org-roam-node-find)
          ("C-c n i" . org-roam-node-insert)
          ("C-c n d" . org-roam-dailies-capture-today) ;<- 新しい日記作成コマンド
          :map org-mode-map
          ("C-M-i" . completion-at-point)))

(use-package ox-hugo
  :ensure t
  :after ox
  :config
  (setq org-hugo-base-dir "~/Documents/riverside-atelier"))

; Org-captureを呼び出すキーシーケンス
;; (define-key global-map "\C-cc" 'org-capture)

;; Org-mode で折返し設定を行うオプションの設定方法
(add-hook 'org-mode-hook #'visual-line-mode)

(setq org-log-done 'time)

(provide '10_org)

;;; 10_org.el ends here
