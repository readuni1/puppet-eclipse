# Class: eclipse::plugin::m2e_buildhelper
#
# This class installs the Eclipse M2E APT Connector
#
# Sample Usage:
#
#  include eclipse::plugin::m2e_apt
#
class eclipse::plugin::m2e_apt (
  $method           = 'package',
  $ensure           = present
) {

  include eclipse
  include eclipse::params

  $repository = 'http://download.jboss.org/jbosstools/updates/m2e-extensions/m2e-apt'

  eclipse::plugin { 'm2e-apt':
    iu         => 'org.jboss.tools.maven.apt.feature.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository}"
  }

}
