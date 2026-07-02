#!/usr/bin/env bash
#
# Instalador del pack Horizon (Dark + Light) para KDE Plasma 6 (CachyOS / Arch-based)
#
# Instala SIEMPRE las dos variantes:
#   - Plasma color schemes  -> ~/.local/share/color-schemes/
#       HorizonDarkClaude.colors
#       HorizonLightClaude.colors
#   - Konsole color schemes -> ~/.local/share/konsole/
#       HorizonDarkClaude.colorscheme
#       HorizonLightClaude.colorscheme
#
# Uso:
#   ./install.sh            -> instala ambas, aplica Horizon Dark Claude
#   ./install.sh light      -> instala ambas, aplica Horizon Light Claude
#   ./install.sh dark       -> instala ambas, aplica Horizon Dark Claude (explicito)
#   ./install.sh none       -> instala ambas, no aplica ninguna automaticamente
#
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PLASMA_DEST="$HOME/.local/share/color-schemes"
KONSOLE_DEST="$HOME/.local/share/konsole"

MODE="${1:-dark}"

echo "==> Instalando pack Horizon (Dark + Light) para KDE Plasma 6..."

mkdir -p "$PLASMA_DEST" "$KONSOLE_DEST"

cp -f "$SCRIPT_DIR/color-schemes/HorizonDarkClaude.colors" "$PLASMA_DEST/HorizonDarkClaude.colors"
cp -f "$SCRIPT_DIR/color-schemes/HorizonLightClaude.colors" "$PLASMA_DEST/HorizonLightClaude.colors"
echo "    Plasma color schemes copiados a: $PLASMA_DEST"

cp -f "$SCRIPT_DIR/konsole/HorizonDarkClaude.colorscheme" "$KONSOLE_DEST/HorizonDarkClaude.colorscheme"
cp -f "$SCRIPT_DIR/konsole/HorizonLightClaude.colorscheme" "$KONSOLE_DEST/HorizonLightClaude.colorscheme"
echo "    Konsole color schemes copiados a: $KONSOLE_DEST"

case "$MODE" in
    dark)
        PLASMA_SCHEME_ID="HorizonDarkClaude"
        KONSOLE_SCHEME_ID="HorizonDarkClaude"
        ;;
    light)
        PLASMA_SCHEME_ID="HorizonLightClaude"
        KONSOLE_SCHEME_ID="HorizonLightClaude"
        ;;
    none)
        PLASMA_SCHEME_ID=""
        KONSOLE_SCHEME_ID=""
        ;;
    *)
        echo "Modo desconocido: '$MODE'. Usar: dark | light | none"
        exit 1
        ;;
esac

# Aplicar color scheme de Plasma
if [ -n "$PLASMA_SCHEME_ID" ]; then
    if command -v plasma-apply-colorscheme >/dev/null 2>&1; then
        echo "==> Aplicando '$PLASMA_SCHEME_ID' en Plasma..."
        plasma-apply-colorscheme "$PLASMA_SCHEME_ID" || echo "    No se pudo aplicar automaticamente. Aplicalo desde System Settings > Colors."
    else
        echo "==> 'plasma-apply-colorscheme' no esta disponible."
        echo "    Aplicalo manualmente en: System Settings > Appearance > Colors"
    fi
fi

# Setear el color scheme en el perfil por defecto de Konsole
if [ -n "$KONSOLE_SCHEME_ID" ]; then
    KONSOLERC="$HOME/.config/konsolerc"
    if [ -f "$KONSOLERC" ]; then
        DEFAULT_PROFILE=$(grep -m1 "^DefaultProfile=" "$KONSOLERC" | cut -d'=' -f2-)
        if [ -n "$DEFAULT_PROFILE" ] && [ -f "$KONSOLE_DEST/$DEFAULT_PROFILE" ]; then
            PROFILE_PATH="$KONSOLE_DEST/$DEFAULT_PROFILE"
            if grep -q "^\[Appearance\]" "$PROFILE_PATH"; then
                if grep -q "^ColorScheme=" "$PROFILE_PATH"; then
                    sed -i "s/^ColorScheme=.*/ColorScheme=$KONSOLE_SCHEME_ID/" "$PROFILE_PATH"
                else
                    sed -i "/^\[Appearance\]/a ColorScheme=$KONSOLE_SCHEME_ID" "$PROFILE_PATH"
                fi
            else
                printf '\n[Appearance]\nColorScheme=%s\n' "$KONSOLE_SCHEME_ID" >> "$PROFILE_PATH"
            fi
            echo "==> Perfil por defecto de Konsole ('$DEFAULT_PROFILE') actualizado con '$KONSOLE_SCHEME_ID'."
        else
            echo "==> No se detecto un perfil de Konsole por defecto para actualizar automaticamente."
            echo "    Seleccionalo manualmente en: Settings > Edit Current Profile > Appearance > Color scheme"
        fi
    else
        echo "==> No se encontro $KONSOLERC (probablemente no abriste Konsole todavia)."
        echo "    Seleccionalo manualmente en: Settings > Edit Current Profile > Appearance > Color scheme"
    fi
fi

echo ""
echo "==> Listo. Ambas variantes quedaron instaladas:"
echo "    - Horizon Dark Claude"
echo "    - Horizon Light Claude"
echo "    Cambialas cuando quieras desde System Settings > Colors (Plasma)"
echo "    y desde Edit Current Profile > Appearance (Konsole)."
