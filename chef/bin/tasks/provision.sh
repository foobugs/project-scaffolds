#!/bin/bash

##
# install.sh
#
# Script for executing chef cookbooks.
##

#
# Variables
#

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." && pwd )"
if [ -L "${BASH_SOURCE[0]}" ]
then
    ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../chef" && pwd )"
fi

CHEF_BINARY="/usr/bin/chef-solo"
CHEF_CONFIG=
CHEF_ATTRIBUTES=

#
# Parameters
#

# Default environment (vagrant, stage, prod, ...)
ENVIRONMENT="vagrant"

#
# Main
#
if [ "$(id -u)" != "0" ]
then
    sudo ./${BASH_SOURCE[0]} "$@"
    exit
fi

# Check Chef executable in default dir
if [ ! -f "${CHEF_BINARY}" ]
then
	CHEF_BINARY="/opt/chef/embedded/bin/chef-solo"
fi

# Exit if Chef is not installed
if [ ! -f "${CHEF_BINARY}" ]
then
	echo "Error: No chef executable found! Install chef before provision."
	exit 1
fi	

CHEF_CONFIG="${ROOT_DIR}/environments/${ENVIRONMENT}/solo-config.rb"
CHEF_ATTRIBUTES="${ROOT_DIR}/environments/${ENVIRONMENT}/solo-attributes.json"

if [ ! -f "${CHEF_CONFIG}" ]
then
	echo "Error: No chef solo config file for env ${ENVIRONMENT}! Create config file."
	exit 1
fi

if [ ! -f "${CHEF_ATTRIBUTES}" ]
then
	echo "Error: No chef solo attributes file for env ${ENVIRONMENT}! Create attributes file."
	exit 1
fi

# Start provisioning
${CHEF_BINARY} -c "${CHEF_CONFIG}" -j "${CHEF_ATTRIBUTES}"

echo "
Provisioning completed ...
"
