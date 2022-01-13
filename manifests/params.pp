# @summary Parameter definiton
#
# @example
#   include kapacitor::params
class kapacitor::params (
  Boolean $manage_repo                             = true,
  String $package_name                             = 'kapacitor',
  String $ensure                                   = 'present',
  Stdlib::HTTPSUrl $repo_location                  = 'https://repos.influxdata.com/',
  String $repo_type                                = 'stable',

  String $group                                    = 'kapacitor',
  String $user                                     = 'kapacitor',

  Stdlib::Absolutepath $configuration_path         = '/etc/kapacitor',
  String $configuration_file                       = 'kapacitor.conf',
  String $configuration_template                   = 'kapacitor/kapacitor.conf.erb',

  Stdlib::Absolutepath $service_defaults           = '/etc/default/kapacitor',
  String $service_default_template                 = 'kapacitor/service-defaults.erb',
  Stdlib::Absolutepath $service_definition         = '/lib/systemd/system/kapacitor.service',
  String $service_definition_template              = 'kapacitor/systemd.service.erb',
  String $service_name                             = 'kapacitor',
  String $service_provider                         = 'systemd',
  Stdlib::Ensure::Service $service_ensure          = 'running',
  Boolean $service_enable                          = true,
  Boolean $service_has_status                      = true,
  Boolean $service_has_restart                     = true,
  Boolean $manage_service                          = true,

  Stdlib::Fqdn $hostname                           = 'localhost',

  Stdlib::Absolutepath $data_dir                   = '/var/lib/kapacitor',
  Enum['directory', 'absent'] $data_dir_manage     = 'directory',

  Boolean $skip_config_overrides                   = false,
  String $default_retention_policy                 = '',
  Boolean $config_override_enabled                 = true,

  Stdlib::Absolutepath $logging_file               = '/var/log/kapacitor/kapacitor.log',
  Enum['present', 'absent'] $logging_file_manage   = 'present',
  String $logging_level                            = 'INFO',

  Boolean $load_enabled                            = true,
  Stdlib::Absolutepath $load_dir                   = '/etc/kapacitor/load',
  Enum['directory', 'absent'] $load_dir_manage     = 'directory',

  Stdlib::Absolutepath $replay_dir                 = '/var/lib/kapacitor/replay',
  Enum['directory', 'absent'] $replay_dir_manage   = 'directory',

  Stdlib::Absolutepath $task_dir                   = '/var/lib/kapacitor/tasks',
  Enum['directory', 'absent'] $task_dir_manage     = 'directory',
  String $task_snapshot_interval                   = '60s',

  Stdlib::Absolutepath $storage_boltdb             = '/var/lib/kapacitor/kapacitor.db',
  Enum['present', 'absent'] $storage_boltdb_manage = 'present',

  Hash $configuration_http                         = {},
  Hash $configuration_tls                          = {},
  Hash $configuration_deadman                      = {},
  Hash $configuration_influxdb                     = {},
  Hash $configuration_kubernetes                   = {},
  Hash $configuration_smtp                         = {},
  Hash $configuration_snmptrap                     = {},
  Hash $configuration_opsgenie                     = {},
  Hash $configuration_opsgenie2                    = {},
  Hash $configuration_victorops                    = {},
  Hash $configuration_pagerduty                    = {},
  Hash $configuration_pagerduty2                   = {},
  Hash $configuration_pushover                     = {},
  Hash $configuration_httppost                     = {},
  Hash $configuration_slack                        = {},
  Hash $configuration_telegram                     = {},
  Hash $configuration_hipchat                      = {},
  Hash $configuration_kafka                        = {},
  Hash $configuration_alerta                       = {},
  Hash $configuration_sensu                        = {},
  Hash $configuration_reporting                    = {},
  Hash $configuration_stats                        = {},
  Hash $configuration_udf                          = {},
  Hash $configuration_talk                         = {},
  Hash $configuration_mqtt                         = {},
  Hash $configuration_swarm                        = {},
  Hash $configuration_collectd                     = {},
  Hash $configuration_opentsdb                     = {},
  Hash $configuration_scraper                      = {},
  Hash $configuration_azure                        = {},
  Hash $configuration_consul                       = {},
  Hash $configuration_dns                          = {},
  Hash $configuration_ec2                          = {},
  Hash $configuration_file_discovery               = {},
  Hash $configuration_gce                          = {},
  Hash $configuration_marathon                     = {},
  Hash $configuration_nerve                        = {},
  Hash $configuration_serverset                    = {},
  Hash $configuration_static_discovery             = {},
  Hash $configuration_triton                       = {},

  Hash $configuration_http_obligatory              = {
    'bind-address'  => ':9092',
    'log-enabled'   => true,
    'write-tracing' => false,
    'pprof-enabled' => false,
    'https-enabled' => false,
  },
) {

}
