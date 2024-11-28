# Jamy's dotfiles repo

A dotfiles repo which includes install scripts for setting up the
environment from a fresh operating system install. This dotfiles repo
can be used for Linux and MacOS machines; I actively use this repo on my
MacbookPro and Linux desktop machine, which I use interchangeably.

Currently only Debian Linux is supported.

## What's included?

### Nix home-manager

`nix run home-manager/master -- switch`

`home-manager switch --flake /path/to/.config/home-manager#jamygolden`

`man home-configuration.nix`

### Shell

Z shell ([Zsh]) is installed on Linux and assumed to be there on MacOS.

### Cli tools

- [base16-shell]
- [bat]
- [direnv]
- [exa]
- [fzf]
- [git]
- [jq]
- [neovim]
- [procs]
- [rename]
- [ripgrep]
- [tealdeer]
- [tmux]
- [trash-cli]
- [zoxide]
- [Docker] (Gui tool for MacOS)

### Languages and package managers

- [Java]
- [Node]
- [Rust]
- [Gradle]
- [nvm]
- [Yarn]
- [Cargo]
- [Homebrew (Mac)]
- [Flatpak (Linux)]

### Gui applications

- [Bitwarden]
- [Discord]
- [Firefox]
- [Google Chrome]
- [Intellij Idea]
- [Signal]
- [Slack]
- [SublimeMerge]
- [SublimeText]
- [Telegram]
- [VLC]
- [Visual Studio Code]
- [WhatsApp]
- [Flatseal] (Linux)
- [Hexchat] (Linux)

## Config

[XDG Base Directory Specification] is followed where possible.

- `jamygolden-dotfiles/.config/*` is symlinked to `$XDG_CONFIG_HOME/*`.
- `.zshenv` is symlinked to `$HOME/.zshenv`. It is the first zsh file to
  be sourced in the home directory, so it's required to be loaded there
  and set the `ZSHDOTDIR` environment variable for the other zsh
  scripts.
- Put your `.zprofile` secrets in
  `jamygolden-dotfiles/secrets/.z_secrets` and `.zshrc` secrets in
  `jamygolden-dotfiles/secrets/.zsh_secrets`

### Linux specific

- `jamygolden-dotfiles/.config/zsh/.zprofile` is symlinked to
  `$HOME/.profile` because Intellij Idea doesn't use ZSH (even when
  specified) and it's important for the secrets to be sourced for
  Intellij Idea.


Dotfiles are installed to `$XDG_CONFIG_HOME` where possible.

## Installation

If bash is installed by default, these scripts will run correctly and
will set up Zsh as the default shell.

The installation will detect what OS you are using and will setup
accordingly.

```bash
$ ./install_all.sh # Setups up Linux machine
$ ./install_symlinks.sh # Symlink dotfiles
$ ./install_post.sh # Postinstall
```

## Zsh script Naming conventions

`.zsh_*` implies the file will only be run when `.zshrc` is run, while
`.z_*` implies the file will be run in `.z_profile`. Read more about the
[Zsh startup/shutdown files].

## Tests

After everything is installed, run `./z_tests` in your shell to test
your zsh setup to ensure it's running correctly.

[Zsh]: https://zsh.sourceforge.io/
[zsh-autosuggestions]: https://github.com/zsh-users/zsh-autosuggestions
[zsh-vi-mode]: https://github.com/jeffreytse/zsh-vi-mode
[base16-shell]: https://github.com/tinted-theming/base16-shell
[bat]: https://github.com/sharkdp/bat
[direnv]: https://direnv.net/
[exa]: https://github.com/ogham/exa
[fzf]: https://github.com/junegunn/fzf
[git]: https://git-scm.com/
[jq]: https://jqlang.github.io/jq/
[neovim]: https://neovim.io/
[procs]: https://github.com/dalance/procs
[rename]: https://github.com/jhotmann/node-rename-cli
[ripgrep]: https://github.com/BurntSushi/ripgrep
[tealdeer]: https://github.com/dbrgn/tealdeer
[tmux]: https://github.com/tmux/tmux
[trash-cli]: https://github.com/andreafrancia/trash-cli
[zoxide]: https://github.com/ajeetdsouza/zoxide
[Docker]: https://www.docker.com/
[Java]: https://www.oracle.com/java/
[Node]: https://nodejs.org
[Rust]: https://www.rust-lang.org/
[Gradle]: https://gradle.org/
[nvm]: https://github.com/nvm-sh/nvm
[Yarn]: https://yarnpkg.com/
[Cargo]: https://doc.rust-lang.org/cargo/
[Homebrew (Mac)]: https://brew.sh/
[Flatpak (Linux)]: https://flatpak.org/
[Bitwarden]: https://bitwarden.com/
[Discord]: https://discord.com/
[Firefox]: https://www.mozilla.org/en-US/firefox/
[Google Chrome]: https://www.google.com/chrome/
[Intellij Idea]: https://www.jetbrains.com/idea/
[Signal]: https://signal.org/en/
[Slack]: https://slack.com/
[SublimeMerge]: https://www.sublimemerge.com/
[SublimeText]: https://www.sublimetext.com/
[Telegram]: https://telegram.org/
[VLC]: https://www.videolan.org/
[Visual Studio Code]: https://code.visualstudio.com/
[WhatsApp]: https://www.whatsapp.com/
[Flatseal]: https://flathub.org/apps/com.github.tchx84.Flatseal
[Hexchat]: https://hexchat.github.io/
[XDG Base Directory Specification]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
[Zsh startup/shutdown files]: https://zsh.sourceforge.io/Doc/Release/Files.html#Files