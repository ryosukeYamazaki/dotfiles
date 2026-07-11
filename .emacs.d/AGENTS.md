# Repository Guidelines

## Project Structure & Module Organization
- `init.el`: Entry point. Bootstraps `use-package` and loads `inits/` via `init-loader`.
- `inits/*.el`: Feature‑scoped modules named `NN_topic.el` (e.g., `65_ruby.el`). Lower numbers load first.
- `snippets/`: Yasnippet snippets.
- `themes/`: Custom themes.
- `tree-sitter/`: Local grammars/config.
- `elpa/`, `straight/`: Package installs. Do not edit by hand.
- State dirs (`auto-save-list/`, `transient/`, `bookmarks`, etc.) are runtime artifacts and not hand‑edited.

## Build, Test, and Development Commands
- Load config (batch sanity):
  - `emacs --batch -Q -l init.el --eval '(message "init OK")'`
- Byte‑compile modules:
  - `emacs --batch -Q -L . -f batch-byte-compile init.el inits/*.el`
- Run ERT tests (if present under `test/`):
  - `emacs --batch -Q -L . -l test/<file>-test.el -f ert-run-tests-batch-and-exit`

## Coding Style & Naming Conventions
- Language: Emacs Lisp.
- Indentation: spaces only, `indent-tabs-mode` = nil, `tab-width` = 2.
- Files in `inits/`: `NN_topic.el` where `NN` controls load order; use clear topics (`10_org.el`, `65_ruby.el`).
- Prefer `use-package` blocks with `:hook`, `:bind`, and `:config` over ad‑hoc requires.
- Guard machine‑specific paths and optional tools:
  - `(when (executable-find "rg") (setq some-var t))`
  - `(when (file-exists-p "~/private.el") (load "~/private.el"))`

## Testing Guidelines
- Unit tests: add ERT tests for non‑trivial functions in `test/<topic>-test.el`.
- Coverage: aim to cover custom helpers and advice functions.
- Naming: `ert-deftest topic-function-behavior () ...)`.

## Commit & Pull Request Guidelines
- Commits: short, imperative subject; include scope when helpful.
  - Example: `inits/65_ruby.el: enable rubocop via use-package`.
- PRs: include a summary, screenshots for UI changes (e.g., themes), and steps to validate (batch load, byte‑compile, relevant ERT).
- Link related issues and mention breaking changes or migration notes.

## Security & Configuration Tips
- Do not commit secrets or API keys. Keep machine‑local overrides out of VCS (e.g., `~/.emacs.d/private.el`).
- Avoid hard‑coded absolute paths; prefer variables or `expand-file-name`.
- Never edit vendor directories (`elpa/`, `straight/`) in PRs.
