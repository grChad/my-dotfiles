<h1 align="center">Configuración para LaTex</h1>

> Resumen para usar Latex con Latexmk y Zathura

## LaTex o TeXLive

Desde el repositorio de _Fedora_ podemos encontrar 3 opciones de LaTex en paquetes de _TeXLive_:

```bash
sudo dnf install texlive-scheme-basic
sudo dnf install texlive-scheme-medium
sudo dnf install texlive-scheme-full
```

También se pueden instalar paquetes por separado de esta manera.

```bash
sudo dnf install 'tex(beamer.cls)'
sudo dnf install 'tex(hyperref.sty)'
```

> [!NOTE]
> es recomendable usar `scheme-medium` o `scheme-full`

## Latexmk

Latexmk también se encuentra en el repositorio de _Fedora_.

```bash
sudo dnf install latexmk
```

Para usarlo sin problemas con _Zathura_(Pre visualizador de documentos). Se requiere de un paso adicional.

<ol>
  <li>
    Crear el directorio <code>latexmk/</code> dentro de la ruta <code>~/.config/</code>.
  </li>
  <li>
    dentro de <code>latexmk/</code> crear el archivo <code>latexmkrc</code> y escribir los siguiente:
    <div>
      <code>
        $pdf_previewer = 'zathura';
      </code>
    </div>
  </li>
</ol>

## Zathura

Este sirve para pre-visualizar documentos como _pdf_, y se encuentra en _Fedora_ como también sus dependencias.

```bash
sudo dnf install zathura zathura-pdf-mupdf
```

Para usarlo también se requiere que el sistema lo reconozca como el pre-visualizador por defecto:

```bash
xdg-mime default org.pwmt.zathura.desktop application/pdf
```

Al igual que _Latexmk_ también se puede configurar(opcional).

<ol>
  <li>
    Crear el directorio <code>zathura/</code> dentro de la ruta <code>~/.config/</code>.
  </li>
  <li>
    dentro de <code>zathura/</code> crear el archivo <code>zathurarc</code> y escribir los siguiente:
    <div>
      <div>
        Esto es para el clipboard
      </div>
      <code>
        set selection-clipboard clipboard
      </code>
    </div>
  </li>
</ol>

## Usar

La forma mas fácil de usar todo es con el comando:

```bash
latexmk -pdf -pvc main.tex
```

- **pdf**: Es para pre-visualizar un documento pdf.
- **pvc**: Es para que recargue al leer los cambios (hot-reload).
- **main.tex**: El archivo _tex_ que se edita.
