{
  config,
  email,
  fullName,
}:
{
  enable = true;
  userName = fullName;
  userEmail = email;
  delta = {
    enable = true;
    options = {
        navigate = true; # use n and N to move between diff sections
        light = false; # set to true if you're in a terminal w/ a light background color (e.g. the default macOS terminal)
        line-numbers = true;
    };
  };
  aliases = {
    # functions
    # ---------
    # use `main` as primary branch if it exists, otherwise `master`
    # -------------------------------------------------------------
    # Reset main branch to origin/main (rho - ResetHomeOrigin)
    rho = "!zsh -c 'source $HOME/.zsh_functions && grho'";

    # Rebase current branch with origin/main
    sync = "!zsh -c 'source $HOME/.zsh_functions && gsync'";

    # Interactive rebase with (as - AutoSquash)
    as = "!zsh -c 'source $HOME/.zsh_functions && gas'";

    # List branches by most recent branch commit (brr - BRanchRecent)
    brr = "!zsh -c 'source $HOME/.zsh_functions && gbrr'";

    # Checkout local branch with fzf (ch - CHeckout)
    ch = "!zsh -c 'source $HOME/.zsh_functions && gch'";

    # Clean already rebased branches (cb - CleanBranches)
    cb = "!zsh -c 'source $HOME/.zsh_functions && gcb'";

    # standard
    # ---------
    co = "checkout";
    commit-pop = "reset --soft HEAD~";
    st = "status -s";
    lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
    br = "branch";
    amend = "commit --amend";
    fix = "commit --fixup";
    pfwl = "push --force-with-lease origin HEAD";
    ra = "rebase --abort";
    rc = "rebase --continue";
    sp = "stash pop";
  };
  ignores = [
    "node_modules/"
    "lua_modules/"
    "*~"
    ".DS_Store"
    "node_env*"
    "Vagrantfile"
    ".vagrant/"

    "# IDEs/Editors"
    "*.sublime-project"
    "*.sublime-workspace"
    ".vscode"
    ".swp"
    "Session.vim"
    ".ideavimrc"
    ".idea/*"
  ];
  extraConfig = {
    init = {
      defaultBranch = "main";
    };
    core = {
      editor = "nvim";
      ignorecase = false;
    };
    pull = {
      rebase = true;
      };
    add.interactive = {
      useBuiltin = false; # required for git 2.37.0
    };
    merge = {
      conflictstyle = "diff3";
    };
    diff = {
      colorMoved = "default";
    };
  };
}