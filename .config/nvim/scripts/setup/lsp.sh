#!/usr/bin/env zsh

npm_package_exists_check() {
  # If the package is not installed
  if [ $(npm list -g | grep -c "$1@") -eq 0 ]; then
    return 1
  fi

  return 0
}

# typescript
if ! npm_package_exists_check "typescript"; then
  npm i -g typescript
fi

# typescript-language-server
if ! npm_package_exists_check "typescript-language-server"; then
  npm i -g typescript-language-server
fi

# eslint and jsonls
if ! npm_package_exists_check "vscode-langservers-extracted"; then
  npm i -g vscode-langservers-extracted
fi

# stylelint
if ! npm_package_exists_check "stylelint-lsp"; then
  npm i -g stylelint-lsp
fi
