maintainer       "foobugs Oelke & Eichner GbR"
maintainer_email "rene.oelke@foobugs.com"
license          "Apache 2.0"
description      "Installs and configures all aspects for development environment."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

recipe            "default", "Common installation and configuration"
recipe            "git", "Installation and configuration for git"
recipe            "unattended-upgrades", "Installation and configuration for unattended-upgrades"

%w{ ubuntu }.each do |os|
  supports os
end
