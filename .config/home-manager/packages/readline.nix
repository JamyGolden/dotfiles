{
  files = {
    ".inputrc".text = ''
      # Make Tab autocomplete regardless of filename case
      set completion-ignore-case on

      # List all matches in case multiple possible completions are possible
      set show-all-if-ambiguous on

      # Immediately add a trailing slash when autocompleting symlinks to directories
      set mark-symlinked-directories on

      # Show all autocomplete results at once
      set page-completions off

      # Be more intelligent when autocompleting by also looking at the text after
      # the cursor. For example, when the current line is "cd ~/src/mozil", and
      # the cursor is on the "z", pressing Tab will not autocomplete it to "cd
      # ~/src/mozillail", but to "cd ~/src/mozilla". (This is supported by the
      # Readline used by Bash 4.)
      set skip-completed-text on

      # Allow UTF-8 input and output, instead of showing stuff like $'\0123\0456'
      set input-meta on
      set output-meta on
      set convert-meta off

      set bell-style none

      # mappings for Ctrl-left-arrow and Ctrl-right-arrow for word moving
      "\e[1;5C": forward-word
      "\e[1;5D": backward-word
      "\e[5C": forward-word
      "\e[5D": backward-word
      "\e\e[C": forward-word
      "\e\e[D": backward-word

      # mappings to have up and down arrow searching through history:
      "\e[A": history-search-backward
      "\e[B": history-search-forward

      # mappings to have left and right arrow go left and right:
      "\e[C": forward-char
      "\e[D": backward-char

      # mapping to have [Tab] and [Shift]+[Tab] to cycle through all the possible completions:
      "\t": menu-complete
      "\e[Z": menu-complete-backward
    '';
  };
}