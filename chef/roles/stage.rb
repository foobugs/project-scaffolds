name "stage"
description "Role for installing and configuring a stage box."

default_attributes({
  "default" => {
    "environment" => "stage"
  },

  "nginx" => {
    "upstream_repository" => "http://nginx.org/packages/ubuntu"
  }
})

override_attributes({
})

run_list(
  "recipe[ntp]",
  "recipe[nginx::repo]",
  "recipe[nginx]",
  "recipe[default]",
  "recipe[default::unattended-upgrades]"
)
