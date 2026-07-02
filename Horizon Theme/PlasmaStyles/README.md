# Horizon — Plasma Style (Dark + Light Claude)

Estructura para `~/.local/share/plasma/desktoptheme/`:

```
HorizonDarkClaude/
├── metadata.json
└── contents/
    ├── widgets/panel-background.svg   # fondo de paneles/taskbar
    ├── widgets/background.svg         # fondo generico de widgets/plasmoids
    ├── widgets/tooltip.svg            # fondo de tooltips
    └── dialogs/background.svg         # fondo de popups, menus, notificaciones, OSD

HorizonLightClaude/
└── (misma estructura)
```

## Instalacion

```bash
mkdir -p ~/.local/share/plasma/desktoptheme
cp -r HorizonDarkClaude ~/.local/share/plasma/desktoptheme/
cp -r HorizonLightClaude ~/.local/share/plasma/desktoptheme/
```

Despues: **System Settings > Appearance > Plasma Style** y elegis "Horizon Dark Claude" o
"Horizon Light Claude".

## Que incluye y que no

Son los 4 elementos de mayor impacto visual (panel, fondo de widgets, tooltips,
dialogos/popups), planos y sin curvas (esquinas rectas a proposito, para evitar
SVGs con arcos que puedan renderizar mal). Cualquier elemento que el theme no
provea (botones, scrollbar, slider, etc.) cae automaticamente al theme por
defecto del sistema (Breeze) — es el comportamiento normal de Plasma con temas
parciales, no es un error.

## Paleta usada

| Pieza               | Horizon Dark Claude | Horizon Light Claude |
|----------------------|--------------|------------------------|
| Panel background     | `#232530`   | `#FADAD1`             |
| Panel highlight (1px)| `#2E303E`   | `#FDF0ED`             |
| Widget background     | `#2E303E`   | `#FDF0ED`             |
| Dialog fill / Tooltip fill | `#232530` / `#2E303E` | `#FDF0ED` / `#F9CBBE` |
| Dialog/tooltip border | `#383B4B`   | `#E3BCAE`             |
