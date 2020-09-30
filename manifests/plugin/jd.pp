# Class: eclipse::plugin::jd
#
# This class installs the Eclipse Java Decompiler
#
# Sample Usage:
#
#  include eclipse::plugin::jd
#
class eclipse::plugin::jd (
  $method           = 'package',
  $ensure           = present
) {

  include eclipse
  include eclipse::params
  
  # Download Zip
  $filename = "jd-eclipse-site-1.0.0-RC2.zip"
  $url = "https://github.com/java-decompiler/jd-eclipse/releases/download/v1.0.0/${filename}"
  include 'archive'
  archive::download {"/usr/src/${filename}":
    ensure           => $ensure,
    source           => $url,
    checksum_type    => 'md5',
    checksum         => "2206be3ed5f707a3b884b4ae929893c3",
  }
  
  
  # Install Plugin
  $repository = "jar:file:/usr/src/${filename}!/"

  eclipse::plugin { 'jd':
    iu         => 'jd.ide.eclipse.feature.feature.group',
    method     => $method,
    repository => "${repository}"
  }

}
