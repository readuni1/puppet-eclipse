# Class: eclipse::plugin::m2e
#
# This class installs the Eclipse M2E
#
# Sample Usage:
#
#  include eclipse::plugin::m2e
#
class eclipse::plugin::m2e (
  $method           = 'package',
  $ensure           = present
) {

  include eclipse
  include eclipse::params

  $repository = 'http://download.eclipse.org/technology/m2e/releases'

  eclipse::plugin { 'm2e':
    iu         => 'org.eclipse.m2e.feature.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository}"
  }

  eclipse::plugin { 'm2e-logback':
    iu         => 'org.eclipse.m2e.logback.feature.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository}"
  }
}
