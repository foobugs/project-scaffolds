name "prod"
description "Role for installing and configuring a production box."

default_attributes({
  "default" => {
    "environment" => "prod"
  },
})

override_attributes({
})

run_list(
  "recipe[ntp]",
  "recipe[default]",
  "recipe[default::unattended-upgrades]"
)
