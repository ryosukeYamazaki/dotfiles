;;; gptel --- gptelの設定

;;; Commentary:

;;; Code:
(use-package gptel
  :ensure t
  :config
  (setq gptel-backend (gptel-make-gemini "Gemini"
                        :key (getenv "GEMINI_API_KEY")
                        :models '(gemini-2.5-pro)
                        :stream t)))

;;; 21_gptel.el ends here
