;;; org-mode --- org mode, org-journalの設定

;;; Commentary:

;;; Code:

(straight-use-package 'org)

(use-package org
  :straight t
  :config
  (setq org-directory "~/Documents/riverside-atelier/org_sources")
  (setq org-default-notes-file "notes.org")
  (setq org-agenda-files
        '("~/Documents/riverside-atelier/org_sources/sketches/tasks.org" "~/Documents/riverside-atelier/org_sources/sketches/projects.org"))
  (setq org-todo-keywords
         '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELLED")))
  :bind
  (("C-c c" . org-capture))
  )

(use-package org-roam
   :init
   (setq org-roam-v2-ack t) ; v2を利用する場合
   :custom
   (org-roam-directory
    (file-truename "~/Documents/riverside-atelier/org_sources"))
   (org-roam-db-location
    (file-truename "~/Documents/riverside-atelier/org_sources/org-roam.db"))
   :config
   (org-roam-setup)
   (require 'org-roam-dailies)
   (setq org-roam-dailies-directory "sketches/dailies/")
   (defun my-org-roam-hugo-header (title section)
     "Generate a common HUGO header for org-roam templates."
     (format (string-join
              '("#+EXPORT_HUGO_PRIVATE: t"
                "#+AUTHOR: moai"
                "#+title: %s"
                "#+HUGO_SECTION: %s"
                "#+hugo_paired_shortcodes: reasoning"
                "#+HUGO_AUTO_SET_LASTMOD: t"
                "")
              "\n")
             title section))
   (setq org-roam-capture-templates
         `(("d" "default" plain "%?"
            :target (file+head "sketches/nodes/%<%Y%m%d%H%M%S>-${slug}.org"
                               ,(my-org-roam-hugo-header "${title}" "sketches/nodes")))
           ("l" "llm" plain "%?"
            :target (file+head "sketches/llm_talk/%<%Y%m%d%H%M%S>-${slug}.org"
                               ,(my-org-roam-hugo-header "${title}" "sketches/llm_talk"))
            :unnarrowed t)
           ("p" "post" plain "%?"
            :target (file+head "posts/%<%Y%m%d%H%M%S>-${slug}.org"
                               ,(my-org-roam-hugo-header "${title}" "posts")))))
   (setq org-roam-dailies-capture-templates
         `(("d" "default" entry "* %?"
            :target (file+head "%<%Y-%m-%d>.org"
                               ,(my-org-roam-hugo-header "%<%Y-%m-%d>" "sketches/dailies")))))
   ;; ショートカットキーの設定例
   :bind (("C-c n l" . org-roam-buffer-toggle)
          ("C-c n f" . org-roam-node-find)
          ("C-c n i" . org-roam-node-insert)
          ("C-c n d" . org-roam-dailies-goto-today)
          :map org-mode-map
          ("C-M-i" . completion-at-point)))


(use-package ox-hugo
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
          (org-hugo-export-wim-to-md))) ;; (org-hugo-export-wim-to-md nil 'async)
      (message "✅ All Org source files have been exported."))))

;; Org-mode で折返し設定を行うオプションの設定方法
(add-hook 'org-mode-hook #'visual-line-mode)

(setq org-log-done 'time)

(provide '10_org)

;;; 10_org.el ends here
