#!/bin/bash
install_path=$(dirname ${BASH_SOURCE[0]})
source $install_path/preexec/bash-preexec.sh
source $install_path/config.sh

preexec_proxy() { 
  if [[ -e /sys/class/net/$proxy_interface ]]; then
    export http_proxy=$proxy_url https_proxy=$proxy_url no_proxy=$proxy_noproxy
  else
    unset http_proxy https_proxy no_proxy
  fi
}

preexec_functions+=(preexec_proxy)
