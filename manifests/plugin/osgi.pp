# Class: eclipse::plugin::osgi
#
# This class installs the Eclipse Tyco Plugin
#
# Sample Usage:
#
#  include eclipse::plugin::osgi
#
class eclipse::plugin::osgi (
  $method           = 'package',
  $ensure           = present
) {

  include eclipse
  include eclipse::params

  $repository = 'http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-tycho/0.7.0/N/0.7.0.201309291400/'

  eclipse::plugin { 'eclipse-pde':
    iu         => 'org.eclipse.pde.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository}"
  }

  eclipse::plugin { 'osgi':
    iu         => 'org.sonatype.tycho.m2e.feature.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository}",
    require    => [ Eclipse::Plugin['eclipse-pde'] ]
  }

}
