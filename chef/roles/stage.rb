name "stage"
description "Role for installing and configuring a stage box."

default_attributes({
  "default" => {
    "environment" => "stage"
  },
})

override_attributes({
})

run_list(
  "recipe[default]",
  "recipe[default::unattended-upgrades]"
)
