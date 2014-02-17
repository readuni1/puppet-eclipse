# Class: eclipse::plugin::yedit
#
# This class installs the Eclipse plugin YEdit
#
# Sample Usage:
#
#  include eclipse::plugin::yedit
#
class eclipse::plugin::yedit (
  $method           = 'p2_director',
  $ensure           =  present
) {
  $repository = 'http://dadacoalition.org/yedit'

  eclipse::plugin { 'yedit':
    iu         => 'org.dadacoalition.yedit.feature.group',
    method     => $method,
    repository => $repository
  }

}