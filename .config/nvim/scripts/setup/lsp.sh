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

# Language Servers
# ----------------
path_local_scripts="$HOME/.local/bin"
path_lsp_repos="$HOME/projects/lsp"

if [ -z $(command -v "lua-language-server") ]; then
  path_lua_language_server="$path_lsp_repos/lua-language-server"

  # build
  mkdir -p $path_lsp_repos
  rm -rf $path_lua_language_server
  git clone "https://github.com/LuaLS/lua-language-server" "$path_lua_language_server"
  cd $path_lua_language_server
  ./make.sh

  # symlink binary
  rm "$path_local_scripts/lua-language-server"
  ln -s "$path_lua_language_server/bin/lua-language-server" "$path_local_scripts/lua-language-server"

  unset -f path_lua_language_server
fi

# kotlin-language-server
if [ -z $(command -v "kotlin-language-server") ]; then
  path_kotlin_language_server="$path_lsp_repos/kotlin-language-server"

  # build
  mkdir -p $path_lsp_repos
  rm -rf $path_kotlin_language_server
  git clone "git@github.com:fwcd/kotlin-language-server.git" $path_kotlin_language_server
  cd $path_kotlin_language_server
  ./gradlew :server:installDist

  # symlink binary
  rm "$path_local_scripts/kotlin-language-server"
  ln -s "$path_kotlin_language_server/server/build/install/server/bin/kotlin-language-server" "$path_local_scripts/kotlin-language-server"

  unset -f path_kotlin_language_server
fi

# cleanup
unset -f npm_package_exists_check
unset -f path_local_scripts
unset -f path_lsp_repos
