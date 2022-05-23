#!/usr/bin/env bash

find_replace () {
  rg "$1"
  if read -n1 -p "choice?Are you sure you? Y/n"; then
    rg "$1" -l | xargs sed -i "s|$1|$2|g"
    echo "\n\"$1\" has replaced \"$2\" successfully"
  else
    echo "\nCancelled"
  fi
}

if [[ ! $(type -t open) == function ]]; then
  open() {
    nohup nautilus -w $1 > /dev/null 2>&1 &
  }
fi

# Git checkout
gch() {
  git checkout "$(git branch | fzf | tr -d '[:space:]')"
}

# Git clean branches
gcb() {
  git branch --merged | grep -Ev "(\*|master|main|develop)" | xargs git branch -d
}

# Kill port
kp() {
  port_re='^[0-9]{4}$'

  # If arg is a valif port
  if [[ $1 =~ $port_re ]]; then
    pid=$(lsof -ti:$1)

    # And a relevant port id exists
    if [ ! -z $pid ]; then
      # Attempt to kill the port
      echo $pid | xargs kill
      
      # If the ports pid still exists alert the user
      updated_pid=$(lsof -ti:$1)
      if [ -z $updated_pid ]; then
        echo "Port $1 has been killed successfully"
      else
        echo "Something went wrong, try manually running \`lsof -ti:$1 | xargs kill -9\`"
      fi
    else
      echo "No matching port: $1"
    fi
  else
    echo "error: Not a port number" >&2;
  fi
}
