# Define: patch::file
#
# Apply a patch on a directory.
#
# === Authors
#
# Martin Meinhold <Martin.Meinhold@gmx.de>
#
# === Copyright
#
# Copyright 2014 Martin Meinhold, unless otherwise noted.
#
define patch::directory (
  Stdlib::Unixpath $cwd = $title,
  $diff_content = undef,
  $diff_source = undef,
  $prefix = undef,
  $path = ['/usr/local/bin', '/usr/bin', '/bin'],
  $strip = 0,
) {

  require ::patch

  $real_prefix = $prefix ? {
    undef   => '',
    default => "${prefix}-"
  }
  $patch_name = md5($title)
  $patch_file = "${patch::patch_dir}/${real_prefix}${patch_name}.patch"

  file { $patch_file:
    ensure  => file,
    content => $diff_content,
    source  => $diff_source,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
  }

  exec { "apply-${patch_name}.patch":
    command => "patch --forward --strip ${strip} < ${patch_file}",
    unless  => "patch --reverse --dry-run --strip ${strip} < ${patch_file}",
    path    => $path,
    cwd     => $cwd,
    require => File[$patch_file],
  }
}
