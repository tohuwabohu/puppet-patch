# Class: patch::params
#
# Default configuration values for the patch class.
#
# === Authors
#
# Martin Meinhold <Martin.Meinhold@gmx.de>
#
# === Copyright
#
# Copyright 2014 Martin Meinhold, unless otherwise noted.
#
class patch::params {
  $ensure = installed

  $package = $::operatingsystem ? {
    default => 'patch',
  }

  $manage_package = true
}
