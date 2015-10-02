# Class: eclipse::plugin::m2e_aspectj
#
# This class installs the Eclipse M2E AspectJ Configurator
#
# Sample Usage:
#
#  include eclipse::plugin::m2e_aspectj
#
class eclipse::plugin::m2e_aspectj (
  $method           = 'package',
  $ensure           = present
) {

  include eclipse
  include eclipse::params

  $repository = 'http://dist.springsource.org/release/AJDT/configurator'

  eclipse::plugin { 'm2e-ajdt':
    iu         => 'org.maven.ide.eclipse.ajdt.feature.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository}"
  }

}
