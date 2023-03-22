#!/usr/bin/env zsh

apt-get install ninja-build

# Language Servers
# ----------------

# Lua language server
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
