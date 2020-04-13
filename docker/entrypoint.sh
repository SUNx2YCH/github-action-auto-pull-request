#!/bin/sh
set -eu

envsubst < /root/.gitconfig.tmpl > $HOME/.gitconfig

hub clone $INPUT_REPOSITORY /tmp/repository/
cd /tmp/repository/

git checkout -b $INPUT_BRANCH
mkdir -p "$(dirname "$INPUT_FILE_PATH")"
echo "$INPUT_FILE_TEMPLATE" > $INPUT_FILE_PATH
git add $INPUT_FILE_PATH
git commit -m "$INPUT_MESSAGE"

hub pull-request --labels "$INPUT_LABELS" \
                 --no-edit \
                 --push \
                 --reviewer "$INPUT_REVIEWERS"
