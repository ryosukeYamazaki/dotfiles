;;; 22_mcp.el --- mcp.elのセットアップ

(defun my-gptel-mcp-connect-all ()
  "Start every configured MCP server and register its tools with gptel."
  (condition-case err
      (gptel-mcp-connect)
    (error
     (message "Could not connect MCP servers to gptel: %s"
              (error-message-string err)))))

(defun my-gptel-mcp-ensure-connected ()
  "Ensure all configured MCP servers are running and available to gptel."
  (condition-case err
      (progn
        ;; Registered tools can outlive a stopped server, so check the server
        ;; processes before asking gptel to register any missing tools.
        (mcp-hub-start-all-server nil nil t)
        (gptel-mcp-connect nil 'sync))
    (error
     ;; An unavailable optional MCP server should not prevent a normal prompt.
     (message "Could not ensure MCP connections: %s"
              (error-message-string err)))))

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
  :config
  (require 'mcp-hub)
  (advice-add 'gptel-send :before #'my-gptel-mcp-ensure-connected)
  :hook (after-init . my-gptel-mcp-connect-all))

(use-package gptel-mcp
  :vc (:url "https://github.com/lizqwerscott/gptel-mcp.el")
  :bind (:map gptel-mode-map
              ("C-c m" . gptel-mcp-dispatch)))

(provide '22_mcp)
;;; 22_mcp.el ends here
