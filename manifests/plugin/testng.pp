# Class: eclipse::plugin::testng
#
# This class installs the Eclipse TestNG Plugin
#
# Sample Usage:
#
#  include eclipse::plugin::testng
#
class eclipse::plugin::testng (
  $method           = 'package',
  $ensure           = present
) {

  include eclipse
  include eclipse::params

  $repository = 'http://beust.com/eclipse'

  eclipse::plugin { 'testng-plugin':
    iu         => 'org.testng.eclipse.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository}"
  }

}
