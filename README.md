# nodenv-nvmrc

This is a plugin for [nodenv](https://github.com/nodenv/nodenv)
that detects the node version based on the current tree's .nvmrc. `.node-version` files still take precedence.

When .nvmrc is configured with a range this plugin chooses the greatest installed version matching the range or exits with an error if none match.

[![Build Status](https://travis-ci.org/ouchxp/nodenv-nvmrc.svg?branch=master)](https://travis-ci.org/ouchxp/nodenv-nvmrc)

## Installation

### Installing with git

```sh
$ git clone https://github.com/ouchxp/nodenv-nvmrc.git $(nodenv root)/plugins/nodenv-nvmrc
```

### Installing with Homebrew

Mac OS X users can install [many nodenv plugins](https://github.com/nodenv/homebrew-nodenv) with [Homebrew](http://brew.sh).

*This is the recommended method of installation if you installed nodenv with
Homebrew.*

```sh
$ brew tap nodenv/nodenv
$ brew install nodenv-nvmrc
```

## Usage

Once you've installed the plugin you can verify that it's working by `cd`ing into a project that has a `.nvmrc` file and does not have a `.node-version` file.  From anywhere in the project's tree, run `nodenv which node`.

## Contributing

To run tests, install [bats](https://github.com/sstephenson/bats) and [nodenv](https://github.com/nodenv/nodenv), then run `bats test`  in the base directory of this plugin

## Credits

This project is heavily inspired by nodenv-package-json-engine[[1]](https://github.com/nodenv/nodenv-package-json-engine).

Shell semver range support provided by [sh-semver](https://github.com/qzb/sh-semver).
