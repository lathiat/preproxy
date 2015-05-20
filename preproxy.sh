#!/bin/bash
install_path=$(dirname ${BASH_SOURCE[0]})
source $install_path/preexec/bash-preexec.sh
source $install_path/config.sh

preexec_proxy() {
  if [[ -e /sys/class/net/$proxy_interface ]]; then
    proxy
  else
    noproxy
  fi
}

# You can call this function with arguments to execute the command
# or without arguments to just modify the current environment
noproxy() {
  unset http_proxy https_proxy no_proxy
  [ "$#" -eq 0 ] && return
  "$@"
  return $?
}

# You can call this function with arguments to execute the command
# or without arguments to just modify the current environment
proxy() {
  export http_proxy=$proxy_url https_proxy=$proxy_url no_proxy=$proxy_noproxy
  [ "$#" -eq 0 ] && return
  "$@"
  return $?
}

if [ "${proxy_mode}" = "auto" ]; then
  preexec_functions+=(preexec_proxy)
fi
