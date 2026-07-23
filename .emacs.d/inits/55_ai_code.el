;;; 55_ai_code.el --- Codex CLI integration -*- lexical-binding: t; -*-

;;; Commentary:
;; Unified interface for AI coding CLIs, using OpenAI Codex by default.

;;; Code:
(use-package vterm
  :defer t
  :config
  ;; tmuxのprefixであるC-tを避けてcopy modeを切り替える。
  (define-key vterm-mode-map (kbd "C-c C-t") nil)
  (define-key vterm-copy-mode-map (kbd "C-c C-t") nil)
  (define-key vterm-mode-map (kbd "C-c C-s") #'vterm-copy-mode)
  (define-key vterm-copy-mode-map (kbd "C-c C-s") #'vterm-copy-mode))

(straight-use-package
 '(ai-code-interface :type git :host github
                     :repo "tninja/ai-code-interface.el" :files ("*.el")))

(use-package ai-code
  :straight nil
  :config
  (ai-code-set-backend 'codex)
  (global-set-key (kbd "C-c a") #'ai-code-menu))

;;; 55_ai_code.el ends here
