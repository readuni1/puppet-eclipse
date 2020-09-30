# Class: eclipse::install::download
#
# This module installs Eclipse using packages
#
# Sample Usage:
#
#  include eclipse::install::download
#
class eclipse::install::download (
  $package         = 'standard',
  $release_name    = 'kepler',
  $service_release = 'SR1',
  $mirror          = 'http://mirror.switch.ch/ftp/mirror',
  $owner_group     = undef,
  $ensure          = present,
  $url             = undef,
  $filename        = undef
) {

  include eclipse::params

  $archsuffix = $::architecture ? {
    /i.86/           => '',
    /(amd64|x86_64)/ => '-x86_64',
    default          => "-${::architecture}"
  }

  if $url == undef {
    $internalFilename = "eclipse-${package}-${release_name}-${service_release}-linux-gtk${archsuffix}"
    $internalUrl = "${mirror}/eclipse/technology/epp/downloads/release/${release_name}/${service_release}/${internalFilename}.tar.gz"
  } else {
    $internalFilename = $filename
    $internalUrl = "${url}/${internalFilename}.tar.gz"
  }

  if $owner_group and $ensure == 'present' {
    exec { 'eclipse ownership':
      command     => "chgrp -R '${owner_group}' '${eclipse::params::target_dir}/eclipse'",
      refreshonly => true,
      subscribe   => Archive[$internalFilename]
    }
    exec { 'eclipse group permissions':
      command     => "find '${eclipse::params::target_dir}/eclipse' -type d -exec chmod g+s {} \\;",
      refreshonly => true,
      subscribe   => Archive[$internalFilename]
    }
    exec { 'eclipse write permissions':
      command     => "chmod -R g+w '${eclipse::params::target_dir}/eclipse'",
      refreshonly => true,
      subscribe   => Archive[$internalFilename]
    }
  }

  # per https://forge.puppet.com/puppet/archive
  include '::archive'
  archive { $internalFilename:
    ensure       => $ensure,
    source       => $internalUrl,
    path         => "/var/tmp/${internalFilename}.tar.gz",
    extract      => true,
    extract_path => $eclipse::params::target_dir,
    creates      => "${eclipse::params::target_dir}/eclipse",
  }

  file { '/usr/share/applications/opt-eclipse.desktop':
    ensure  => $ensure,
    content => template('eclipse/opt-eclipse.desktop.erb'),
    mode    => 644,
    require => Archive[$internalFilename]
  }

}
