# Class: eclipse::plugin::gfm
#
# This class installs the Eclipse plugin GitHub Flavored Markdown
#
# Sample Usage:
#
#  include eclipse::plugin::gfm
#
class eclipse::plugin::gfm (
  $method           = 'p2_director',
  $ensure           =  present
) {
  $repository = 'https://raw.github.com/satyagraha/gfm_viewer/master/p2-composite/'

  eclipse::plugin { 'gfm-markdown':
    iu         => 'code.satyagraha.gfm.viewer.feature.feature.group',
    method     => $method,
    repository => $repository
  }



}