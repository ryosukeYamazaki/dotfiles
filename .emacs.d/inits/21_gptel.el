;;; gptel --- gptelの設定

;;; Commentary:

;;; Code:
(use-package gptel
  :config
  (require 'gptel-integrations)
  ;;(require 'gptel-org)
  (setq gptel-use-curl t
        gptel-use-tools t
        gptel-default-mode 'org-mode
        gptel-confirm-tool-calls 'always
        gptel-include-tool-results 'auto
        gptel-system-prompt
        (concat
         (alist-get 'default gptel-directives)
         " Respond in Japanese."
         " Answer the user's request directly and concisely."
         " Do not end with follow-up questions, offers to help further,"
         " suggestions for next steps, or phrases such as"
         " 「必要であれば〜できます」「〜しましょうか？」."
         " When the user explicitly asks for suggestions or alternatives,"
         " provide them, but do not append an additional offer afterward."))
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
