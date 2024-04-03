# Dotfiles

This contains the dotfiles for my system

## Requirements

Ensure you have the following `git` and `stow` installed on your system.

### Stow

```
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:MarLapuz/dotfiles.git
$ cd dotfiles
```

then use [GNU stow](https://www.gnu.org/software/stow/) to create symlinks

```
$ stow .
```

### Resource

- [GNU stow](https://www.gnu.org/software/stow/)
- [Dreams of Autonomy guide](https://www.youtube.com/watch?v=y6XCebnB9gs)
