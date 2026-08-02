# Development environment config

Personal configuration files for my development environment, kept in sync across macOS and WSL/Linux.

## Contents

### `oh-my-zsh` config

- Custom `.zshrc` config file
- Custom theme `thibz`

### `nano` config

- Custom `.nanorc` file

## Installation

### Prerequisites

- [Oh My Zsh](https://ohmyz.sh) installed
- `git` and `zsh` available on your system

### Usage

1. Clone this repository:

   ```bash
   git clone https://github.com/thibaultrichel/dev-config.git
   cd dev-config
   ```

2. Make the install script executable:

   ```bash
   chmod +x install-dev-config.sh
   ```

3. Run it:

   ```bash
   ./install-dev-config.sh
   ```

4. Reload your shell:

   ```bash
   source ~/.zshrc
   ```

### What it does

The script symlinks the config files from this repo into your home directory:

| Source | Destination |
|---|---|
| `oh-my-zsh/.zshrc` | `~/.zshrc` |
| `oh-my-zsh/thibz.zsh-theme` | `~/.oh-my-zsh/custom/themes/thibz.zsh-theme` |
| `nano/.nanorc` | `~/.nanorc` |

Any existing file at these locations is backed up (with a timestamp) before being replaced.

Compatible with **macOS** and **WSL/Linux**.
