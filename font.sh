#!/bin/bash
# get parent file of the current directory
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
# import dependencies
source $SRC_DIR/set_colors.sh
source $SRC_DIR/log.sh


function installHermit()
{
  if [[ ! -d ~/.font/hermit ]]; then
    mkdir -p ~/.font/{hermit,tmp}
    # stream to tar without downloading to disk and unzip to the target location :)
    wget -qO - https://pcaro.es/d/otf-hermit-1.21.tar.gz | tar xz -C ~/.font/hermit
    msg_prompt "Donwload and unpacking to ~/.font/hermit"
    rsync -r ~/.font/hermit/ /Users/$USER/Library/Fonts --exclude="LICENSE"
  else
    msg_nested_done "Font already installed. - Skipping."
  fi;
  msg_prompt "Font located in ~/Library/Fonts"
}

function install_and_apply_font(){
  msg_prompt "Installing Hermit Font"
  installHermit
  msg_done "Done Installing"
  msg_nested_done "Applying Hermit font"
  set_font "Hermit medium" 20
}

install_and_apply_font

# if [[ `uname` == 'Darwin' ]]; then
#   # link "$dotfiles/sublime/Packages/User/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
# fi
