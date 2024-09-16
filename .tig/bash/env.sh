#!/bin/bash
source "$PWD/.tig/sh.conf"
source "$PWD/.config"
export BASH_DIR=$(dirname "$(realpath "$BASH_SOURCE")")
export Red="\033[31m"
export Blue="\033[34m"
export Green="\033[32m"
export Bold="\033[1m"
export Italic="\033[3m"
export Underline="\033[4m"
export Reverse="\033[7m"
export Title="\033[0;37;44m"
export Normal="\033[0m"
export Title=`echo -e '\033[0;37;44m'`
export Blank="\033[0;30;47m"

export IS_RINNING=true