;;; gptel --- gptelの設定

;;; Commentary:

;;; Code:
(use-package gptel
  :ensure t
  :config
  (setq gptel-default-mode 'org-mode)
  (setq gptel-api-key (getenv "CHATGPT_API_KEY"))
  (gptel-make-anthropic "Claude"
    :key (getenv "CLAUDE_API_KEY")
    :models '(claude-3-7-sonnet-20250219)
    :stream t)
  (gptel-make-anthropic "Claude"
    :key (getenv "CLAUDE_API_KEY")
    :models '(claude-3-7-sonnet-20250219)
    :stream t)
  (setq gptel-backend (gptel-make-gemini "Gemini"
                        :key (getenv "GEMINI_API_KEY")
                        :models '(gemini-2.5-pro)
                        :stream t)))

;;; 21_gptel.el ends here
