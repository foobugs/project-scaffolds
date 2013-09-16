name "vagrant"
description "Role for installing and configuring a vagrant box."

default_attributes({
  "default" => {
    "environment" => "vagrant"
  },
})

override_attributes({
})

run_list(
  "recipe[ntp]",
  "recipe[default]",
  "recipe[default::unattended-upgrades]"
)
