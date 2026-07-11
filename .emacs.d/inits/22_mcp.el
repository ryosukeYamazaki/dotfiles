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
     ("context7" . (:command "npx" :args ("-y" "@upstash/context7-mcp") :env (:DEFAULT_MINIMUM_TOKENS "6000")))
     ("notion" . (:command "npx" :args ("-y" "@notionhq/notion-mcp-server") :env (:NOTION_TOKEN ,(getenv "NOTION_TOKEN"))))))
  :config (require 'mcp-hub)
  :hook (after-init . mcp-hub-start-all-server))

(use-package gptel-mcp
  :vc (:url "https://github.com/lizqwerscott/gptel-mcp.el")
  :bind (:map gptel-mode-map
              ("C-c m" . gptel-mcp-dispatch)))

(provide '22_mcp)
;;; 22_mcp.el ends here
