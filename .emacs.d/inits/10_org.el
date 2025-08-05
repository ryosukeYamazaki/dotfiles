;;; org-mode --- org mode, org-journalの設定

;;; Commentary:

;;; Code:

(use-package org
  :ensure t
  :config
  (setq org-directory "~/Documents/riverside-atelier/org_sources")
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
    (file-truename "~/Documents/riverside-atelier/org_sources"))
   (org-roam-db-location
    (file-truename "~/Documents/riverside-atelier/org_sources/org-roam.db"))
   :config
   ;; Org-roam本体の有効化
   (org-roam-setup)
   ;; Dailies機能（日記機能）の設定
   (require 'org-roam-dailies)
   (setq org-roam-dailies-directory "sketches/dailies/")
   (setq org-roam-capture-templates
         '(("d" "default" plain "%?"
            :target (file+head "sketches/nodes/%<%Y%m%d%H%M%S>-${slug}.org" ; ← "nodes/" を追加
                               "#+EXPORT_HUGO_PRIVATE: t\n#+AUTHOR: moai\n#+title: ${title}\n#+HUGO_SECTION: sketches/nodes\n#+HUGO_AUTO_SET_LASTMOD: t\n"))))
   (setq org-roam-dailies-capture-templates
         `(("d" "default" entry "* %?"
            :target (file+head "%<%Y-%m-%d>.org"
                               "#+EXPORT_HUGO_PRIVATE: t\n#+AUTHOR: moai\n#+title: %<%Y-%m-%d>\n#+HUGO_SECTION: sketches/dailies\n#+HUGO_AUTO_SET_LASTMOD: t\n"))))
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
)

(defun my-hugo-export-all-org-sources ()
  "Export all .org files from `org_sources` to Hugo's content directory."
  (interactive)
  (let* ((org-sources-path (expand-file-name "org_sources" "~/Documents/riverside-atelier/"))
         (org-files (directory-files-recursively org-sources-path "\\.org$")))
    (when (y-or-n-p (format "Export %d Org files to Markdown?" (length org-files)))
      (dolist (file org-files)
        (with-current-buffer (find-file-noselect file)
          (message "Exporting %s ..." (buffer-name))
          ;; Export the whole file to one Markdown file
          (org-hugo-export-wim-to-md nil 'async)))
      (message "✅ All Org source files have been exported."))))

;; Org-mode で折返し設定を行うオプションの設定方法
(add-hook 'org-mode-hook #'visual-line-mode)

(setq org-log-done 'time)

(provide '10_org)

;;; 10_org.el ends here
