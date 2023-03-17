# Jamy's dotfiles repo

## Installation

### Linux

These scripts assume bash is installed by default, but sets up ZSH as
the default shell.

```bash
$ ./install_linux.sh # Setups up Linux machine
$ ./install_all.sh # Shared setup between Mac and Linux
$ ./install_symlinks.sh # Symlink dotfiles
$ ./install_post.sh # Postinstall
```

### Mac

```bash
$ ./install_mac.sh # Setups up Linux machine
$ ./install_all.sh # Shared setup between Mac and Linux
$ ./install_symlinks.sh # Symlink dotfiles
$ ./install_post.sh # Postinstall
```

# Naming conventions

`.zsh_*` implies the file will only be run when `.zshrc` is run, while
`.z_*` implies the file will be run in `.z_profile`. Read more about the
[Z shell startup/shutdown files].

[Z shell startup/shutdown files]: https://zsh.sourceforge.io/Doc/Release/Files.html#Files
