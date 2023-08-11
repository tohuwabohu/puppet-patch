# patch

[![License](https://img.shields.io/github/license/tohuwabohu/puppet-patch.svg)](https://github.com/tohuwabohu/puppet-patch/blob/master/LICENSE.txt)
[![Puppet Forge](https://img.shields.io/puppetforge/v/tohuwabohu/patch.svg)](https://forge.puppetlabs.com/tohuwabohu/patch)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/tohuwabohu/patch.svg)](https://forge.puppetlabs.com/tohuwabohu/patch)

## Overview

Manage and apply diff files on original files using the patch command.

## Usage

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

* Apply diff to a directory
```
patch::directory { '/path/to/target/directory':
  diff_source => '/path/to/diff',
  strip => 2,
}
```

## Limitations

The module has been tested on the following operating systems. Testing and patches for other platforms are welcome.

* Debian 7.0 (Wheezy)
* Debian 8.0 (Jessie)
* Ubuntu 14.04 (Trusty Tahr)
* Ubuntu 16.04 (Xenial Xerus)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Development

This project uses rspec-puppet and beaker to ensure the module works as expected and to prevent regressions.

```
gem install bundler
bundle install --path vendor

bundle exec rake spec
bundle exec rake beaker
```
(note: see [Beaker - Supported ENV variables](https://github.com/puppetlabs/beaker-rspec/blob/master/README.md)
for a list of environment variables to control the default behaviour of Beaker)
