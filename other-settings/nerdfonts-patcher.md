<h1 align="center">Usar Nerd Fonts (Patcher)</h1>

El archivo `FontPatcher/font-patcher` es un script de _python_ y requiere tener instalado `fontforge`.

## Dependencias

- _fontforge_: `sudo dnf install fontforge`
- _python_: Ya biene instalado.
- archivo `FontPatcher.zip`(recomendado) o la AppImage `AppImage`(des-actualizada) desde el repositorio de _Github_ `ryanoasis/nerd-fonts`.

## Usar

Ejecute el siguiente comando:

```bash
fontforge -script FontPatcher/font-patcher path-to-font/font.otf --complete --adjust-line-height -out withPath
```

- **fontforge:** Programa instalado en este caso fedora.
- **-script:** Un Flag para ejecuta en este caso el script de _python_.
- **FontPatcher/font-patcher:** El script de python. Al descomprimir `FontPatcher.zip`, se obtiene el directorio `FontPatcher` y dentro se encuentra este script.
- **path-to-font/font.otf:** Ruta de la fuente que se quiere patcher, puede aceptar otros formatos como (**.ttf**).
- **--complete:** Flag para utilizar todos los _glyphs_ disponibles.
- **--adjust-line-height:** Flag para ajustar la altura de linea(centra los separadores de linea de manera uniforme).
- **-out:** Flag que indica la ruta de salida de la fuente a la que se modifico.
- **withPath** Ruta al directorio donde se quiere guardar la fuente procesada.

## Mas información

Para mas información visite:

- https://github.com/ryanoasis/nerd-fonts/
- https://github.com/ryanoasis/nerd-fonts/releases/latest/
