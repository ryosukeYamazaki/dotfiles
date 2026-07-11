# 依存関係

以下のパッケージに依存している。順にインストールすること
ただし、インストールshの中でダウンロードしてくれるはず。
 - direnv
 - asdf
 - cargo

## Codex の完了通知（macOS）

Codex CLI の回答完了時に、macOS 通知と tmux 内メッセージを表示する。

`~/.codex/config.toml` のユーザーレベル設定に次を追加する。

```toml
notify = ["/Users/ryosuke.yamazaki/dotfiles/scripts/codex-notify"]
```

設定後に Codex CLI を起動し直すと有効になる。
