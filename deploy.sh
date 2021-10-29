#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'basic app'
git push -f git@githun.com:yashpatwa60/vue-TodoApp.git master:gh-pages

cd -

