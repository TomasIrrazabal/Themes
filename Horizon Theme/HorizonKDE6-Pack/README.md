# Horizon — Pack para KDE Plasma 6 (CachyOS)

Theme inspirado en Horizon (VS Code), adaptado a Plasma 6 y Konsole. Incluye dos
variantes:

- **Horizon Dark Claude** — la original, basada en tu paleta.
- **Horizon Light Claude** — variante clara, mismo acento de marca, semitonos
  reajustados para contraste sobre fondo claro.

Pensado para CachyOS con KDE6, pero funciona en cualquier distro con Plasma 6.

## Contenido

```
HorizonKDE6-Pack/
├── color-schemes/
│   ├── HorizonDarkClaude.colors             # Plasma - Horizon Dark Claude
│   └── HorizonLightClaude.colors      # Plasma - Horizon Light Claude
├── konsole/
│   ├── HorizonDarkClaude.colorscheme        # Konsole - Horizon Dark Claude
│   └── HorizonLightClaude.colorscheme # Konsole - Horizon Light Claude
├── install.sh                         # Instalador automatico
└── README.md
```

## Instalacion automatica

```bash
chmod +x install.sh
./install.sh          # instala ambas, aplica Horizon Dark Claude
./install.sh light    # instala ambas, aplica Horizon Light Claude
./install.sh none     # instala ambas, no aplica ninguna (elegis a mano)
```

El script siempre copia las dos variantes a:
- `~/.local/share/color-schemes/`
- `~/.local/share/konsole/`

y, segun el modo elegido, aplica una de las dos con `plasma-apply-colorscheme` y
actualiza el perfil por defecto de Konsole.

## Instalacion manual

### Plasma

```bash
mkdir -p ~/.local/share/color-schemes
cp color-schemes/HorizonDarkClaude.colors ~/.local/share/color-schemes/
cp color-schemes/HorizonLightClaude.colors ~/.local/share/color-schemes/
```

Despues: **System Settings > Appearance > Colors**, elegis "Horizon Dark Claude" o
"Horizon Light Claude".

O por terminal:

```bash
plasma-apply-colorscheme HorizonDarkClaude
plasma-apply-colorscheme HorizonLightClaude
```

### Konsole

```bash
mkdir -p ~/.local/share/konsole
cp konsole/HorizonDarkClaude.colorscheme ~/.local/share/konsole/
cp konsole/HorizonLightClaude.colorscheme ~/.local/share/konsole/
```

Despues, en Konsole: **Settings > Edit Current Profile > Appearance > Color scheme**,
elegis "Horizon Dark Claude" o "Horizon Light Claude".

Para aplicar a una sesion abierta sin tocar el perfil guardado:

```bash
konsoleprofile colors=HorizonDarkClaude
konsoleprofile colors=HorizonLightClaude
```

## Paleta

| Token               | Dark RGB / Hex          | Light RGB / Hex (Horizon Light Claude) |
|---------------------|--------------------------|------------------------------------------|
| Background          | 28,30,38 `#1C1E26`       | 250,218,209 `#FADAD1`                   |
| Background (panel)  | 35,37,48 `#232530`       | 253,240,237 `#FDF0ED`                   |
| Foreground          | 220,223,228 `#DCDFE4`    | 40,42,54 `#282A36`                      |
| Accent / Red        | 233,86,120 `#E95678`     | 233,86,120 `#E95678` (igual en ambas)   |
| Green                | 41,211,152 `#29D398`     | 22,150,108 `#16966C`                    |
| Yellow/Orange        | 250,183,149 `#FAB795`    | 189,107,53 `#BD6B35`                    |
| Blue                 | 38,187,217 `#26BBD9`     | 13,123,153 `#0D7B99`                    |
| Magenta/Purple       | 238,100,174 `#EE64AE`    | 176,58,138 `#B03A8A`                    |
| Cyan                 | 89,225,227 `#59E1E3`     | 39,150,152 `#279698`                    |
| Comment / Muted      | 108,111,147 `#6C6F93`    | 152,138,128 `#988A80`                   |

El acento de marca (`#E95678`, el rosa/rojo característico de Horizon) se mantiene
idéntico en ambas variantes para conservar identidad visual. Los demás colores
semánticos (verde, amarillo, azul, magenta, cyan) se oscurecieron/saturaron en la
variante light porque los tonos pastel del dark theme pierden legibilidad como texto
sobre fondo blanco.

## Notas

- Ambos archivos `.colors` incluyen todos los grupos que pide Plasma 6 (`Window`,
  `View`, `Button`, `Selection`, `Tooltip`, `Header`, `Complementary`, `WM`, efectos
  de color para widgets inactivos/deshabilitados).
- Los fondos de la variante light usan la paleta calida (crema/durazno) del Horizon
  Bright original (`#FDF0ED`, `#FADAD1`, `#F9CBBE`), no grises frios con tinte azul.
- En Konsole, los 16 colores ANSI de la variante light están reordenados respecto al
  dark: los tonos "intensos" (bold) usan los pasteles originales, y los tonos
  "normales" usan versiones más oscuras para mantener legibilidad en texto plano.
