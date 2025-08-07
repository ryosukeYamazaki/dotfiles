;;; 22_mcp.el --- mcp.elのセットアップ

(use-package mcp
  :straight t
  :after gptel
  :custom
  (mcp-hub-servers
   `(
     ("duckduckgo" . (:command "uvx" :args ("duckduckgo-mcp-server")))
     ("fetch" . (:command "uvx" :args ("mcp-server-fetch")))
     ("filesystem" . (:command "npx" :args ("-y" "@modelcontextprotocol/server-filesystem" ,(getenv "HOME"))))
     ("sequential-thinking" . (:command "npx" :args ("-y" "@modelcontextprotocol/server-sequential-thinking")))
     ("context7" . (:command "npx" :args ("-y" "@upstash/context7-mcp") :env (:DEFAULT_MINIMUM_TOKENS "6000")))))
  :config (require 'mcp-hub)
  :hook (after-init . mcp-hub-start-all-server))

(provide '22_mcp)
;;; 22_mcp.el ends here
