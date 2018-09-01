# get parent directory of the current file
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
# import dependencies
source $SRC_DIR/set_colors.sh
source $SRC_DIR/log.sh

ask "Setting up new Machine?(Y/n)"
read answer
[[ "$answer" != 'Y' ]] && msg 'Exiting...' && exit 1
msg "Starting machine setup..."

sleep 0.4 & showLoading 'Setup bash Prompt'
sleep 0.5 & showLoading 'Font' 'msg_nested_lvl_done'
msg_nested_lvl_done "Hello" '' 1
msg_nested_lvl_done 'Terminal Prompt' '' 2
msg_nested_lvl_done 'Terminal Prompt' '' 2
msg_nested_lvl_done 'Terminal Prompt' '' 3
sleep 1 & showLoading 'Setup exports paths' msg_nested_lvl_done '' 3
showLoading 'Setup aliases' 'msg_category' '' 5
msg_nested_lvl_done 'Setup helper'

msg_done "Setup Done..."
msg '\n'
