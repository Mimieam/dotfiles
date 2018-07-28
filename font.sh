#!/bin/bash
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
# get parent file of the current directory
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source $SRC_DIR/log.sh
msg_config $SRC_DIR/log.sh


function installHermit()
{
  mkdir -p ~/.font/{hermit,tmp}
  # stream to tar without downloading to disk and unzip to the target location :)
  wget -qO - https://pcaro.es/d/otf-hermit-1.21.tar.gz | tar xvz -C ~/.font/hermit
  echo "Donwload and unpacking to ~/.font/hermit"
  rsync -rv ~/.font/hermit/ ~/.font/tmp/ --exclude="LICENSE"
  echo "Installing to /Users/$USER/Library/Fonts"
}


echo "Installing Hermit Font"
installHermit
echo "Done Installing"


if [[ `uname` == 'Darwin' ]]; then
  msg_og 'Done  '
  # link "$dotfiles/sublime/Packages/User/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
fi