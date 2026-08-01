# AGENTS.md

このリポジトリは `chezmoi` で管理する dotfiles である。エージェントは人間向けの README ではなく、本ファイルの指示に従うこと。

## 概要

- ソース状態: このリポジトリ（chezmoi source directory）
- ターゲット: `$HOME`
- 変更は必ずソース側で行い、`chezmoi apply` でホームへ反映する
- 秘密情報・マシン固有の設定はリポジトリに入れない

## 命名規則

| ソース | ターゲット |
|--------|------------|
| `dot_zshrc.tmpl` | `~/.zshrc` |
| `dot_tmux.conf` | `~/.tmux.conf` |
| `dot_config/nvim/init.vim` | `~/.config/nvim/init.vim` |
| `compton.conf` | `~/compton.conf` |

- `dot_` 接頭辞はターゲット上で `.` になる
- `dot_config/` は `~/.config/` に対応する
- `.tmpl` 付きファイルは Go template として評価される（`lookPath`, `.chezmoi.os`, `.chezmoi.sourceDir` など）

## ディレクトリの役割

**適用対象（ホームへ出る）**

- `dot_*`, `dot_config/`, `compton.conf` など

**非適用（リポジトリ管理専用。ホームへ出さない）**

- `README.md`, `AGENTS.md`, `.cursor/`, `tools/`, `polybar/`
- 条件付き ignore は [`.chezmoiignore`](.chezmoiignore) を参照すること

## 編集ワークフロー

1. このリポジトリのソースファイルを編集する
2. 差分を確認する: `chezmoi diff`
3. dry-run で適用内容を確認する: `chezmoi apply -n`
4. 問題なければ適用する: `chezmoi apply`
5. 必要なら整合性を確認する: `chezmoi verify`

ホーム直下のファイルを直接編集してソースと乖離させてはならない。

## 秘密情報とローカル設定

- API キー、トークン、パスワード、個人の絶対パスなどを commit しない
- マシン固有の zsh 設定は `~/.zshrc.local` に置く（`dot_zshrc.tmpl` が source する）
- 共通化できる設定だけをこのリポジトリに追加する

## 条件分岐

- コマンドの有無で内容を変える: `.tmpl` 内で `lookPath` を使う
- コマンドや OS でファイル自体を適用しない: `.chezmoiignore` に条件を追加する
- 既存の分岐パターンを踏襲し、独自の書き方を増やさない

## Do / Don't

**Do**

- 変更前に `chezmoi diff` を実行する
- OS / コマンド依存は `.chezmoiignore` または `.tmpl` で分岐する
- 変更は依頼された範囲に限定する
- リポジトリ管理用ファイルを追加したら `.chezmoiignore` にも載せる

**Don't**

- `$HOME` のファイルだけを編集して終わる
- 秘密情報をソースに書く
- 無関係なリファクタやフォーマット変更を広げる
- `chezmoi apply` を確認なしで破壊的に実行する前提で進める

## 完了条件

タスク完了前に次を満たすこと。

- [ ] `chezmoi diff` で意図した差分だけになっている
- [ ] 新規のリポジトリ管理ファイルがあれば `.chezmoiignore` に追加済み
- [ ] `.tmpl` / `.chezmoiignore` の template 構文が壊れていない
- [ ] 秘密情報やマシン固有値が含まれていない
