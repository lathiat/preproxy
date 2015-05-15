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
