# dotfiles

Using [chezmoi](https://www.chezmoi.io) to manage.

## Installation

To install and use these dotfiles, you can just install [chezmoi](https://www.chezmoi.io), and initialize a `~/.config/chezmoi/chezmoi.toml` file with at least the following structure:

```toml
[data]
name = "<your git name here>"
email = "<your git email here>"
signingkey = "<your signingKey ID here>"
```

### Installation options

There are three installation options, depending on how you want to install and use [chezmoi](https://www.chezmoi.io). The following sections include parts of the [chezmoi](https://www.chezmoi.io) documentation, that I found useful to keep here for easy access.

#### 1. Single-command Installation

[chezmoi](https://www.chezmoi.io)'s install script can run `chezmoi init` for you by passing extra arguments to the newly installed chezmoi binary. If your dotfiles repo is `github.com/$GITHUB_USERNAME/dotfiles` then installing chezmoi, running `chezmoi init`, and running chezmoi apply can be done in a single line of shell:

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply aik8
```

#### 2. Single-command One-shot Installation

For setting up transitory environments (e.g. short-lived Linux containers) you can install chezmoi, install your dotfiles, and then remove all traces of chezmoi, including the source directory and chezmoi's configuration directory, with a single command:

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --one-shot aik8
```

#### 3. Standard Installation

This method assumes that you installed [chezmoi](https://www.chezmoi.io) using your preferred method. Then you just run:

```shell
chezmoi init --apply aik8
```
