;;;;; straight.el
(defvar bootstrap-version)
(setq straight-profiles
      `((nil . ,(expand-file-name "straight-versions.el"
                                  user-emacs-directory))))
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(require 'use-package)
(setq straight-use-package-by-default t)

;;;;; init-loader
(use-package init-loader
  :config
  (init-loader-load "~/.emacs.d/inits"))
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (treemacs-icons-dired treemacs-evil lsp-mode helm-egats-plus helm-git-grep magit helm-projectile auto-highlight-symbol path-headerline-mode coffee-mode helm-ag helm-config git-gutter madhat2r-theme init-loader use-package)))
;;  '(ruby-insert-encoding-magic-comment nil)
;;  '(safe-local-variable-values
;;    (quote
;;     ((eval setq flycheck-command-wrapper-function
;; 	   (lambda
;; 	     (command)
;; 	     (append
;; 	      (quote
;; 	       ("bundle" "exec"))
;; 	      command)))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
