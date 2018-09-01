#!/bin/bash

# https://unix.stackexchange.com/questions/189787/difference-between-echo-and-echo-e

function msg {
    echo -e "\033[0;37m$1\033[0m";
}

function question {
    echo -n -e "\033[0;32m$1\033[0m ";
}

function ask {
    echo -n -e "\033[0;32m$1\033[0m ";
}

function msg_ok {
    echo -e$2 "\033[1;32m $1 \033[0m";
}

function msg_prompt {
    echo -ne "➜\033[1;33m $1 \033[0m";
}
function msg_nested_done {
    echo -ne "   * \033[0;37m $1 \033[0m";
}
function msg_category {
    echo -e$2 "   * \033[0;33m $1 \033[0m";
}

function msg_nested_lvl_done {
    # echo -e$2 '\t'{0..2} "➜ \033[0;37m $1 \033[0m"
    # oneliner for tabs
    for i in $( eval echo {1..$3} ); do echo -en '\t'; done;
    echo -e$2 " ➜ \033[0;37m $1 \033[0m";
}

function msg_config {
    echo -e$2 "➜ \033[1;36m $1 ✔\033[0m";
}

function msg_run {
    echo -e$2 "➜\033[1;35m $1  $2\033[0m";
}

function msg_done {
    echo -e$2 "✔ \033[1;37m $1 \033[0m";
}

# inspired from https://codingdiscovery.blogspot.com/2014/03/show-loading-dots-in-bash-script.html
# doSomeTask & showLoading "DOING SOME TASK"
# fontSetupFunction & showLoading 'Setting up Font' 'msg_nested_lvl_done'
#
showLoading() {
  mypid=$!

  loadingText=$1

  style=$2
  [[ -z "$style" ]] && style='msg_category';

  $style "$loadingText\r" 'n' $3

  while kill -0 $mypid 2>/dev/null; do
    $style "$loadingText.\r" 'n' $3
    sleep 0.5
    $style "$loadingText..\r" 'n' $3
    sleep 0.5
    $style "$loadingText...\r" 'n' $3
    sleep 0.5
    $style "\r\033[K" 'n' # reset caret
    $style "$loadingText\r" 'n' $3
    sleep 0.5
  done

  # get exit status of last ran cmd - $? not always reliable
  # do touch /234 | echo $?   a couple of time to see...
  # permission is denied by exit code is 0... will investigate later
  [[ $? -eq 0 ]] && status='✔' || status='✖'

  "$style" "$loadingText... $status" $3
}

