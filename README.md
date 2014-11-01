#patch

##Overview

Manage and apply diff files on original files using the patch command.

##Usage

* Install patch with package settings; this itself doesn't do much. To apply patches, you have to use `patch::file`.
```
class { 'patch': }
```

* Apply diff referenced by a file on a given original file
```
patch::file { '/path/to/file':
  diff_source => '/path/to/diff',
}
```

* Apply inline diff on a given original file
```
patch::file { '/path/to/file':
  diff_content => '<inline-diff>',
}
```

* Apply two diff files in a particular order on the same original file
```
$target = '/path/to/file'
patch::file { 'first-patch':
  target      => $target,
  prefix      => '0001',
  diff_source => '/path/to/0001.diff',
}
patch::file { 'second-patch':
  target      => $target,
  prefix      => '0002',
  diff_source => '/path/to/0002.diff',
  require     => Patch::File['first-patch'],
}
```

##Limitations

The module has been tested on the following operating systems. Testing and patches for other platforms are welcome.

* Debian Linux 6.0 (Squeeze)

[![Build Status](https://travis-ci.org/tohuwabohu/puppet-patch.png?branch=master)](https://travis-ci.org/tohuwabohu/puppet-patch)

##Contributors

The list of contributors can be found at: https://github.com/tohuwabohu/puppet-patch/graphs/contributors
