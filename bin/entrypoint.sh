#!/bin/bash
set -e

# Rails に対応したファイル server.pid が存在しているかもしれないので削除する。
rm -f /myapp/tmp/pids/server.pid

# サーバーを起動する。
bundle exec bin/rails s -p 3000 -b '0.0.0.0'

# コンテナーのプロセスを実行する。（Dockerfile 内の CMD に設定されているもの。）
exec "$@"
