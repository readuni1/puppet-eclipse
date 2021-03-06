# Class: eclipse::plugin::dltk::ruby
#
# This class installs the Eclipse plugin DLTK Ruby
#
# Sample Usage:
#
#  include eclipse::plugin::dltk::ruby
#
class eclipse::plugin::dltk::ruby (
  $method           = 'p2_director',
  $ensure           =  present,
  $version          = '5.1'
) {
  $repository = 'http://download.eclipse.org/technology/dltk/updates-dev/5.1'

  eclipse::plugin { 'dltk-ruby':
    iu         => 'org.eclipse.dltk.ruby.feature.group',
    method     => $method,
    repository => $repository
  }

}
