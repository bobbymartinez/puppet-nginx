class nginx::monitoring(
  $ensure = 'present'
){

  nagios3::service { 'check-nginx-config':
    ensure                => $ensure,
    service_description   => 'check-nginx-config',
    check_command         => 'check_nrpe_1arg!check_nginx_config',
    nrpe_command_name     => 'check_nginx_config',
    nrpe_command_line     => "/usr/lib/nagios/plugins/check_nginx_config",
    nrpe_command_source   => "puppet:///modules/${module_name}/nagios/check_nginx_config.rb",
    host_name             => $::fqdn,
    contact_groups        => 'admins',
    instance_name         => $internal_nagios_monitor
  }
  
}