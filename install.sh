#!/usr/bin/env bash
#
# install.sh
# Run this from inside the dev-config repo directory.
# Symlinks the config files into place. Works on macOS and WSL/Linux
# (detects OS automatically for any future OS-specific files).
#
# Usage:
#   cd dev-config
#   chmod +x install-dev-config.sh
#   ./install-dev-config.sh

set -euo pipefail

# Resolve the directory this script lives in (= repo root)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Detecting OS..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi
echo "    Detected: $OS"

# --- 1. Symlink .zshrc ----------------------------------------------------
echo "==> Linking .zshrc..."
if [[ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d%H%M%S)"
    echo "    Existing .zshrc backed up."
fi
ln -sf "$REPO_DIR/oh-my-zsh/.zshrc" "$HOME/.zshrc"

# --- 2. Symlink custom theme -----------------------------------------------
THEME_SRC="$REPO_DIR/oh-my-zsh/thibz.zsh-theme"
THEME_DST="$HOME/.oh-my-zsh/custom/themes/thibz.zsh-theme"
if [[ -f "$THEME_SRC" ]]; then
    echo "==> Linking custom theme..."
    mkdir -p "$HOME/.oh-my-zsh/custom/themes"
    ln -sf "$THEME_SRC" "$THEME_DST"
else
    echo "    (skipped: $THEME_SRC not found — adjust path in script if needed)"
fi

# --- 3. Symlink .nanorc -----------------------------------------------------
echo "==> Linking .nanorc..."
if [[ -f "$HOME/.nanorc" && ! -L "$HOME/.nanorc" ]]; then
    mv "$HOME/.nanorc" "$HOME/.nanorc.backup.$(date +%Y%m%d%H%M%S)"
    echo "    Existing .nanorc backed up."
fi
ln -sf "$REPO_DIR/nano/.nanorc" "$HOME/.nanorc"

# --- 4. Done -----------------------------------------------------------
echo ""
echo "==> Done! Config files linked from $REPO_DIR"
echo "    Restart your terminal or run: source ~/.zshrc"
