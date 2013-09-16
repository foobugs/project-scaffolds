name "vagrant"
description "Role for installing and configuring a vagrant box."

default_attributes({
  "default" => {
    "environment" => "vagrant"
  },

  "nginx" => {
    "upstream_repository" => "http://nginx.org/packages/ubuntu"
  },

  "mysql" => {
    "bind_address" => "127.0.0.1",
    "allow_remote_root" => false,
    "remove_anonymous_users" => true,
    "remove_test_database" => true,
    "tunable" => {
      "key_buffer_size" => "32M",
      "max_connections" => "200",
      "table_cache" => "128",
      "innodb_buffer_pool_size" => "256M",
      "sql_mode" => "STRICT_ALL_TABLES",
      "log_warnings" => 1,
      "log_error" => "/var/log/mysql/error.log",
      "log_bin" => true,		 				 # enable bin log as required for replication
      "query_cache_size" => "0",				 # disable query cache
      "thread_concurrency" => 6,
      "innodb_thread_concurrency" => 6
    }
  }
})

override_attributes({
})

run_list(
  "recipe[ntp]",
  "recipe[nginx::repo]",
  "recipe[nginx]",
  "recipe[default::mysql]",
  "recipe[mysql::server]",
  "recipe[default::mysql_create_users]",
  "recipe[default]",
  "recipe[default::unattended-upgrades]"
)
