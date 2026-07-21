;;; gptel --- gptelの設定

;;; Commentary:

;;; Code:
(use-package gptel
  :config
  (require 'gptel-integrations)
  ;;(require 'gptel-org)
  (setq gptel-use-curl t
        gptel-use-tools t
        gptel-confirm-tool-calls 'always
        gptel-include-tool-results 'auto
        gptel--system-message (concat gptel--system-message " Make sure to use Japanese language."))
  (setq gptel-api-key (getenv "CHATGPT_API_KEY")) ;; chatGPTだけ特別にこのようにする。
  (gptel-make-anthropic "Claude"
    :key (getenv "CLAUDE_API_KEY")
    :models '(claude-3-7-sonnet-20250219)
    :stream t)
  (gptel-make-gemini "Gemini"
    :key (getenv "GEMINI_API_KEY")
    ;;:models '(gemini-3.0-pro)
    :models '(gemini-3-flash-preview)
    :stream t)
  ;; ChatGPT Plus/Pro subscription via OAuth.  The first use opens the
  ;; OpenAI login flow.  Gemini remains available from the gptel menu.
  (setq gptel-model 'gpt-5.4-mini
        gptel-backend (gptel-make-openai-oauth "OpenAI-sub"))
  :bind (("C-c g" . gptel-send)
         ("C-c r" . gptel-rewrite)))

;;; 21_gptel.el ends here
