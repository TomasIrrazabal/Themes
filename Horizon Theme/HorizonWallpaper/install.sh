#!/usr/bin/env bash
#
# Instalador del wallpaper dinamico Horizon Claude (light/dark) para Plasma 6.
#
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="$HOME/.local/share/wallpapers/HorizonClaude"

echo "==> Instalando wallpaper Horizon Claude..."
mkdir -p "$HOME/.local/share/wallpapers"
rm -rf "$DEST"
cp -r "$SCRIPT_DIR/HorizonClaude" "$DEST"
echo "    Copiado a: $DEST"

echo ""
echo "==> Listo. Para usarlo:"
echo "    1. Clic derecho en el escritorio > Configure Desktop and Wallpaper"
echo "    2. Wallpaper Type: Image"
echo "    3. Elegi 'Horizon Claude' en la grilla"
echo "    Plasma va a cambiar sola entre la imagen clara y la oscura segun"
echo "    el color scheme (o el ciclo dia/noche) que tengas activo."
