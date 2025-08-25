# README

## github codespacesの使い方
- 対象のリポジトリ右上のCODEからcode spaceを作成する。
- codespaceは起動して、30分以上動きがなければ自動的にクローズされるのでその場合は再度展開する。

## github codespacesの起動方法

```
rbenv install 3.2.6 && eval "$(rbenv init -)" && rbenv shell 3.2.6
```
```
bundle install
```
```
bundle config set --local path 'vendor/bundle'
```
```
yarn install
```
```
bin/rails db:migrate
```

起動コマンド
```
bundle exec bin/dev
```
このコマンドを入力すると画面上にportが開かれるのでそれをクリックするとみることができる。
