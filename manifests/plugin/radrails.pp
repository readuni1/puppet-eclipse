# Class: eclipse::plugin::radrails
#
# This class installs the Eclipse plugin Aptana RadRails
#
# Sample Usage:
#
#  include eclipse::plugin::radrails
#
class eclipse::plugin::radrails (
  $method           = 'p2_director',
  $ensure           =  present
) {
  $repository = 'http://download.aptana.com/tools/radrails/plugin/install/radrails-bundle'

  eclipse::plugin { 'radrails':
    iu         => 'com.aptana.radrails.feature.feature.group',
    method     => $method,
    repository => $repository
  }

}
