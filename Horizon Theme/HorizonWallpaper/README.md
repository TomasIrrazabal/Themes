# Horizon Claude — Wallpaper dinamico (light/dark) para Plasma 6

Paquete de wallpaper que cambia solo entre una imagen clara y una oscura segun
el color scheme activo (o el ciclo dia/noche de Plasma).

## Contenido

```
HorizonClaude/
├── metadata.json
└── contents/
    ├── images/1672x941.png        # se usa con color scheme light
    └── images_dark/1672x941.png   # se usa con color scheme dark
install.sh
```

## Instalacion

```bash
chmod +x install.sh
./install.sh
```

Esto copia la carpeta `HorizonClaude` a `~/.local/share/wallpapers/`.

Despues:

1. Clic derecho en el escritorio > **Configure Desktop and Wallpaper**
   (o `System Settings > Wallpaper`).
2. **Wallpaper Type: Image**.
3. Elegi **Horizon Claude** en la grilla de miniaturas.

A partir de ahi, Plasma muestra automaticamente:
- la imagen de `images/` (atardecer pastel) cuando el color scheme activo es
  claro (ej. **Horizon Light Claude**),
- la imagen de `images_dark/` (atardecer magenta con luna) cuando el color
  scheme activo es oscuro (ej. **Horizon Dark Claude**).

Tambien funciona si activas el ciclo dia/noche automatico
(`Switch to Dark Mode at Night` / `Configure Day/Night Cycle...`).

## Instalacion manual (alternativa)

```bash
mkdir -p ~/.local/share/wallpapers
cp -r HorizonClaude ~/.local/share/wallpapers/
```

## Nota

Si en algun momento querés agregar mas tamaños (por ejemplo para una pantalla
4K), basta con sumar otro archivo `WIDTHxHEIGHT.png` dentro de `images/` y
`images_dark/` con la resolución correspondiente — Plasma elige automaticamente
el archivo mas cercano a la resolución real de la pantalla.
