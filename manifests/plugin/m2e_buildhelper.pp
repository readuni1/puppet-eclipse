# Class: eclipse::plugin::m2e_buildhelper
#
# This class installs the Eclipse M2E BuildHelper Connector
#
# Sample Usage:
#
#  include eclipse::plugin::m2e_buildhelper
#
class eclipse::plugin::m2e_buildhelper (
  $method           = 'package',
  $ensure           = present
) {

  include eclipse
  include eclipse::params

  $repository = 'http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-buildhelper/0.15.0/N/0.15.0.201405280027/'

  eclipse::plugin { 'm2e-buildhelper':
    iu         => 'org.sonatype.m2e.buildhelper.feature.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository}"
  }

}
