#!/usr/bin/env bash

set -e

# === CONFIG ===
INSTALL_DIR="$HOME/bin"
APPIMAGE_NAME="nvim.appimage"
INSTALL_PATH="$INSTALL_DIR/$APPIMAGE_NAME"

# Create install dir if missing
mkdir -p "$INSTALL_DIR"

echo "[1] Downloading latest Neovim AppImage..."
TMP_FILE=$(mktemp)
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o "$TMP_FILE"

echo "[2] Replacing old Neovim AppImage (if any)..."
mv "$TMP_FILE" "$INSTALL_PATH"

echo "[3] Making AppImage executable..."
chmod +x "$INSTALL_PATH"

echo "[4] Checking version..."
"$INSTALL_PATH" --version | head -n 3

echo "✅ Neovim updated successfully!"
echo "Make sure your ~/.zshrc has: alias nvim=\"$INSTALL_PATH\""

