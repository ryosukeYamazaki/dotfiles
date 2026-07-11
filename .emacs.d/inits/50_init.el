(use-package modus-themes
  :config
  (load-theme 'modus-vivendi t))

(show-paren-mode t)
(setq show-paren-delay 0) ;表示までの秒数。初期値は0.125
(setq show-paren-style 'expression)    ;括弧内も強調
(global-auto-revert-mode 1) ; ファイルが更新されたらreloadする

(defvar dired-use-ls-dired)
(setq dired-use-ls-dired nil)

;; gitの差分表示
(use-package git-gutter)
(global-git-gutter-mode t)

(use-package which-key)

;; ctrl-hをバックスペースとして使う。
(global-set-key "\C-h" 'delete-backward-char)

;; 括弧のペアとかは適宜入れて欲しい
(electric-pair-mode t)

(when (display-graphic-p)
  (set-face-attribute 'default nil
                      :family "JetBrains Mono"
                      :height 140))

;; ediffの設定
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; 空白表示
(use-package whitespace :straight nil)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark))

(setq whitespace-display-mappings
      '(
        (space-mark ?\u3000 [?\u2423])
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])
        ))
(setq whitespace-trailing-regexp  "\\([ \u00A0]+\\)$")
(setq whitespace-space-regexp "\\(\u3000+\\)")
(set-face-attribute 'whitespace-trailing nil
                    :foreground "RoyalBlue4"
                    :background "RoyalBlue4"
                    :underline nil)
(set-face-attribute 'whitespace-tab nil
                    :foreground "color-247"
                    :background "color-234"
                    :underline nil)
(set-face-attribute 'whitespace-space nil
                    :foreground "gray40"
                    :background "gray20"
                    :underline nil)



;; 行数表示
(if (version<= "26.0.50" emacs-version)
    (progn
      (global-display-line-numbers-mode)
      (defun display-line-numbers-color-on-after-init (frame)
        "Hook function executed after FRAME is generated."
        (unless (display-graphic-p frame)
          (set-face-background
           'line-number
           (plist-get base16-solarized-dark-colors :base01))))
      (add-hook 'after-make-frame-functions
                (lambda (frame)
                  (display-line-numbers-color-on-after-init frame)))
      ))

;; 空白表示の設定
(global-whitespace-mode 1)
;; pathをheaderに表示させる設定
(use-package path-headerline-mode)
(path-headerline-mode +1)

;; auto-highlight
(use-package auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)
(add-hook 'after-init-hook 'global-auto-highlight-symbol-mode)

(use-package ripgrep)

;; git 用
(use-package compat)
(use-package transient)
(use-package magit-section)
(use-package magit
  :after (compat transient))
;; (use-package magit-delta
;;       :hook (magit-mode . magit-delta-mode))
(with-eval-after-load "magit"
  (setq magit-completing-read-function 'ivy-completing-read))

(global-set-key (kbd "C-x g") 'magit-status)

(use-package flycheck)
(global-flycheck-mode)

(use-package which-key)
(which-key-mode)

(use-package company
  :config
  (setq lsp-completion-provider :capf))
