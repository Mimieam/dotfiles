#!/bin/bash
# get parent file of the current directory
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
# import dependencies
source $SRC_DIR/set_colors.sh
source $SRC_DIR/log.sh

function ask {
  question "$1" 
}

function await_for_answer {
  read -r answer
}

function install_dotfiles {
  dir="$HOME/Dev/config"
  rm -rf $dir
  mkdir -p $dir
  cd $dir
  git clone --recursive git://github.com/mimieam/dotfiles.git
  cd dotfiles
  # sudo bash symlink-dotfiles.sh
}

msg 'Starting a New Installation'
ask 'Cloning dotfile to $HOME/Dev/config/  ? [Y/n]' 
await_for_answer
if [[ "$answer" == 'Y' ]] ; then
  if [[ "$HOME/Dev/config/" ]]; then 
    ask '$HOME/Dev/config already exists would you like to override  ? [Y/n]'
    await_for_answer 
    [[ "$answer" == 'Y' ]] && install_dotfiles || msg_ok 'Installation Aborted'
  fi
else 
  msg_ok 'Installation Aborted'
fi
