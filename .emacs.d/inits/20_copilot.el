(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :ensure t)

(use-package copilot-chat
  :straight (:host github :repo "chep/copilot-chat.el" :files ("*.el"))
  :after (request org markdown-mode)
  :bind (:map global-map
            ("C-c C-y" . copilot-chat-yank)
            ("C-c M-y" . copilot-chat-yank-pop)
            ("C-c C-M-y" . (lambda () (interactive) (copilot-chat-yank-pop -1))))
)

(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
