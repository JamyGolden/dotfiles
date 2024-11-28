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

# nix
if [[ -n "$(command -v 'nil')" ]]; then
  cargo install --git https://github.com/oxalica/nil nil
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

# nix lsp
if [[ -n "$(command -v 'nil')" ]]; then
  cargo install --git https://github.com/oxalica/nil nil
fi

if [[ "$OS_TYPE" == "mac" ]]; then
  brew install ninja

  # nvim lsp
  brew install kotlin-language-server lua-language-server
fi

if [[ -n "$(command -v 'rust-analyzer')" ]]; then
  if [[ "$OS_TYPE" == "mac" ]]; then
    brew install rust-analyzer
  fi
fi

if [[ "$OS_TYPE" == "debian" ]]; then
  sudo apt install ninja-build
  # Language Servers
  # ----------------
  path_local_scripts="$XDG_BIN_HOME"
  path_lsp_repos="$HOME/projects/lsp"

  mkdir -p $path_lsp_repos

  # Kotlin language server
  if [ -z "$(command -v 'kotlin-language-server')" ]; then
    path_kotlin_language_server="$path_lsp_repos/kotlin-language-server"

    # build
    rm -rf $path_kotlin_language_server
    git clone "git@github.com:fwcd/kotlin-language-server.git" $path_kotlin_language_server
    cd $path_kotlin_language_server
    ./gradlew :server:installDist

    # symlink binary
    rm "$path_local_scripts/kotlin-language-server"
    ln -s "$path_kotlin_language_server/server/build/install/server/bin/kotlin-language-server" "$path_local_scripts/kotlin-language-server"

    unset -f path_kotlin_language_server
  fi

  # Lua language server
  if [ -z "$(command -v 'lua-language-server')" ]; then
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
fi

# For treesitter markdown
if [ -z "$(command -v 'markdown-oxide')" ]; then
  cargo install --locked --git https://github.com/Feel-ix-343/markdown-oxide.git markdown-oxide
fi