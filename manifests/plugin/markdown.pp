# Class: eclipse::plugin::markdown
#
# This class installs the Eclipse plugin markdown
#
# Sample Usage:
#
#  include eclipse::plugin::markdown
#
class eclipse::plugin::markdown (
  $method           = 'p2_director',
  $ensure           =  present
) {
  $repository = 'http://dl.bintray.com/enide/Markdown/1.0.0/'

  eclipse::plugin { 'markdown':
    iu         => 'markdown.editor.feature.feature.group',
    method     => $method,
    repository => $repository
  }

}