#!/bin/bash

# https://unix.stackexchange.com/questions/189787/difference-between-echo-and-echo-e

function msg {
	echo -e "\033[0;37m$1\033[0m";
}

function msg_ok {
	echo -e "\033[1;32m $1 \033[0m";
}

function msg_prompt {
	echo -e "➜\033[1;33m $1 \033[0m";
}
function msg_nested_done {
	echo -e "   * \033[0;37m $1 \033[0m";
}
function msg_category {
	echo -e "   * \033[0;33m $1 \033[0m";
}

function msg_nested_lvl_done {
	echo -e "       ➜ \033[0;37m $1 \033[0m";
}

function msg_config {
	echo -e "➜ \033[1;36m $1 ✔\033[0m";
}

function msg_run {
	echo -e "➜\033[1;35m $1  $2\033[0m";
}

function msg_done {
	echo -e "✔ \033[1;37m $1 \033[0m";
}
