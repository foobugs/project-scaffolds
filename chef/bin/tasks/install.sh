#!/bin/bash

##
# install.sh
#
# Script for installing chef-solo.
##

#
# Variables
#

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." && pwd )"
if [ -L "${BASH_SOURCE[0]}" ]
then
    ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../chef" && pwd )"
fi

CHEF_BINARY="/opt/chef/bin/chef-solo"

#
# Parameters
#

# Default environment (vagrant, stage, prod, ...)
ENVIRONMENT="vagrant"

#
# Main
#
# Check for root
if [ "$(id -u)" != "0" ]
then
    sudo ./${BASH_SOURCE[0]} "$@"
    exit
fi

# Check Chef executable
if [ ! -f "${CHEF_BINARY}" ]
then
	wget -q -O- https://www.opscode.com/chef/install.sh | bash
fi

echo "PATH=/opt/chef/embedded/bin:$PATH" > /etc/profile.d/chef.sh

echo "
Installation completed ...
"
