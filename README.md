# dotfiles

This repository is managed with `chezmoi`.

## Setup

### 1. Install chezmoi

Follow the [official installation instructions](https://www.chezmoi.io/install/).

### 2. Apply this repository

From a fresh machine:

```sh
chezmoi init --apply https://github.com/rkun123/dotfiles.git
```

If you cloned the repository locally first, you can also apply it from the checkout:

```sh
chezmoi init --apply /path/to/this/repository
```

### 3. Edit files through chezmoi

Use `chezmoi edit` or modify the source state directly in this repository, then run:

```sh
chezmoi apply
```
