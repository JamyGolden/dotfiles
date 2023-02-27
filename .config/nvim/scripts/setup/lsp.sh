#!/bin/bash

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

# lua-language-server
path_lsp_repos="$HOME/projects/lsp"
path_lua_language_server="$path_lsp_repos/lua-language-server"
path_local_scripts="$HOME/.local/bin"

mkdir -p $path_lsp_repos
rm -rf $path_lua_language_server
git clone https://github.com/LuaLS/lua-language-server $path_lua_language_server
cd $path_lua_language_server
./make.sh
cp "$path_lua_language_server/bin/lua-language-server" "$path_local_scripts"

# cleanup
unset -f npm_package_exists_check
