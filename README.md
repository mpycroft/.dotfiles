# .dotfiles

A collection of configuration dotfiles for my development setup, currently only
handles Mac OS config as that is my development environment at the moment but
should not require significant changes to support Linux/Windows.

This uses [dotbot](https://github.com/anishathalye/dotbot) as the management
tool for the dotfiles, handling linking, installation, etc. and
[dotbot-brew](https://github.com/d12frosted/dotbot-brew) as a plugin for
handling Homebrew installation and packages.

When run the install file will perform the following actions:

* Clean links in the home directory
* Install [Homebrew](https://brew.sh) and packages listed in the Brewfile

## Structure

Files are split into a few different directories for easier organisation.

* data - Contains data used during installation

## Installation

The Xcode Command Line Tools need to be installed before cloning and installing
the dotfiles.

```shell
xcode-select --install
```

The following commands will clone the repository and setup the environment.

```shell
cd ~
git clone https://github.com/mpycroft/.dotfiles.git
.dotfiles/install
```
