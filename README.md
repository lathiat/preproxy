preproxy

# Summary
This tool automatically sets or unsets proxy related shell variables, depending on if a VPN is up or down.

This is done before each command execution, which is superior to other methods that may make the determination once per shell launch, or possibly when the prompt is displayed.

# Installation
```
git clone https://github.com/lathiat/preproxy ~/.preproxy
echo "source ~/.preproxy/preproxy.sh" >> ~/.bashrc
```

# Configuration

Edit ~/.preproxy/config.sh and set the appropriate variables.
Examples are provided, however we leave proxy_url blank by default to ensure
that we don't start setting invalid/unexpected proxies

```
# preproxy configuration

# * proxy_auto *
# Automatically set and unset the proxy as required everytime a command is invoked.  This
# is the default behavior.
#
# If disabled, you can specifically enable or disable the proxy by using the commands
# proxy and noproxy, optionally passing in the command to run
#
# Comment this out to disable
export proxy_mode=auto

# * proxy_interface *
#
# This is the interface we check exists, in order to deside we need the proxy
export proxy_interface=vpn0

# * proxy_url *
# The proxy hostname, protocol and port as a URL
#
# Example: http://int-proxy.corp:3128
export proxy_url=

# * proxy_noproxy *
# List of hostnames not to proxy.  This is not supported by all programs.
#
# Example: localhost,127.0.0.1,corp
export proxy_noproxy=localhost,127.0.0.1,::1
```

# Usage

The default configuration will automatically determine before each command whether to use the proxy
or not.  You can disable that by commenting out the proxy_mode option.

Whether automatic mode is enabled or not, you can manually request the proxy is set or unset using
the proxy and noproxy commands.  You can run them without argument to change the current shell
environment, or you can pass a command to modify the environment for that command only.

```
lathiat@ubuntu:~/src/preproxy$ noproxy export|grep http_proxy
lathiat@ubuntu:~/src/preproxy$ proxy export|grep http_proxy
declare -x http_proxy="http://int-proxy.corp:3128"
lathiat@ubuntu:~/src/preproxy$ noproxy; export|grep http_proxy
lathiat@ubuntu:~/src/preproxy$ proxy; export|grep http_proxy
declare -x http_proxy="http://int-proxy.corp:3128"
lathiat@ubuntu:~/src/preproxy$
```

# Credit
Thanks to Ryan Caloras for [bash-preexec.sh](https://github.com/rcaloras/bash-preexec)
