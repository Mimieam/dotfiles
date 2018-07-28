#!/bin/bash
# get parent file of the current directory
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
# import dependencies
source $SRC_DIR/set_colors.sh
source $SRC_DIR/log.sh

msg_config $SRC_DIR/log.sh

function installHermit()
{
  if [[ ! -d ~/.font/hermit ]]; then
    mkdir -p ~/.font/{hermit,tmp}
    # stream to tar without downloading to disk and unzip to the target location :)
    wget -qO - https://pcaro.es/d/otf-hermit-1.21.tar.gz | tar xz -C ~/.font/hermit
    echo "Donwload and unpacking to ~/.font/hermit"
    rsync -r ~/.font/hermit/ /Users/$USER/Library/Fonts --exclude="LICENSE"
  else
    res="Font already installed. - Skipping."
    echo -e  "➜\033[1;33m ${res} \033[0m\n";
    msg_prompt hi;
  fi;
  echo "Installing to /Users/$USER/Library/Fonts"
}


echo "Installing Hermit Font"
installHermit
msg_done "Done Installing"
msg_config "Applying font"
set_font "Hermit medium" 20


if [[ `uname` == 'Darwin' ]]; then
  msg_done 'Done  Setting up font'
  # link "$dotfiles/sublime/Packages/User/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
fi