(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :config
  (defun ry/copilot-server-installed-p ()
    (or (executable-find copilot-server-executable)
        (let ((server (expand-file-name
                       (concat (unless (eq system-type 'windows-nt) "bin/")
                               copilot-server-executable)
                       copilot-install-dir)))
          (file-executable-p server))))

  (defun ry/copilot-ensure-server-installed ()
    (unless (ry/copilot-server-installed-p)
      (copilot-install-server)
      (message "Installing %s; enable copilot-mode again after it finishes."
               copilot-server-package-name)))

  (ry/copilot-ensure-server-installed)

  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion))

(use-package copilot-chat
  :straight (:host github :repo "chep/copilot-chat.el" :files ("*.el"))
  :after (request org markdown-mode)
  :bind (:map global-map
            ("C-c C-y" . copilot-chat-yank)
            ("C-c M-y" . copilot-chat-yank-pop)
            ("C-c C-M-y" . (lambda () (interactive) (copilot-chat-yank-pop -1))))
)
