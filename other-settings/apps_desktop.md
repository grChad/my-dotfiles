<h1 align="center">Aplicaciones para el Equipo</h1>

> imageAplicaciones o programas que requiero en mi día a día.

## Navegador Brave

Una alternativa a _Google-Chrome_ pero con muchas mas mejoras y seguridad al usar.

<div align="center">
  <img src="https://brave.com/static-assets/images/brave-logo-sans-text.svg" alt="brave logo" title="brave logo">
</div>

Instalación según la pagina oficial de [Brave/linux](https://brave.com/linux/)

```bash
sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install brave-browser
```

Esto podría cambiar con el tiempo, siempre estar atento a los cambios.

## Audacity

Un editor de audio libre y el más popular en el entorno GNU/Linux.

<div align="center">
  <img width="100px" src="https://www.audacityteam.org/_astro/Audacity_Logo.63b57726.svg" alt="audacity logo" title="audacity logo">
</div>

La instalación esta disponible tanto desde la `Tienda de Software` de _Fedora_ como por terminal:

```bash
sudo dnf install audacity
```

## Zathura <img src="https://pwmt.org/static/img/logo.png">

Es un visor de PDF simple y sencillo que uso para editar en LaTex.

Esta en el repositorio de _Fedora_, instalar por terminal.

```bash
sudo dnf install zathura
```

## Selector de color

Un programa simple que hace lo que promete, disponible en la `Tienda de software` de _Fedora_.

## Tux Typing

Un juego divertido de escritura y para mejorar la velocidad de escritura. Disponible en la `Tienda de software` de _Fedora_.

<div align="center">
  <img src="https://images.sftcdn.net/images/t_app-icon-s/p/4fed82ea-96d6-11e6-a89f-00163ec9f5fa/574674166/tux-typing-linux-155549_960_720.webp" alt="tux typing logo" title="tux typing logo">
</div>

## Keypunch

<div align="center" >
  <img width="70%" src="https://github.com/bragefuglseth/keypunch/blob/main/data/screenshots/2-ready.png?raw=true" alt="image to keypunk" title="image to keypunk">
</div>

Una aplicación simple para practicar macanografía. Permite el uso de una gran variedad de idiomas disponibles.

La instalacion biene de un packete de flatpak llamada `dev.bragefuglseh.keypunch`, tambien en _github_ como [bragefuglseth/keypunch](https://github.com/bragefuglseth/keypunch) o por ultimo desde la tienda de software de _Fedora_ siempre que se tengan habilitados los paquetes de _Flatpak_.

## Dialect

Es un traductor fácil de usar. Disponible en la `Tienda de Software` de _Fedora_.

## fontforge

Un programa para editar una fuente o modificar una que ya tengas descargada:

```shell
dnf search fontforge
```

Te saldrá tanto la version normal para sistemas `.x86_64` o `.i686`. Se instalara el que sea compatible con la estructura de tu sistema.

```shell
sudo dnf install fontforge
```

## Gimp

Programa que manipula imágenes a nivel profesional, libre.

<div align="center">
  <img src="https://www.gimp.org/images/frontpage/wilber-big.png" alt="gimp logo" title="gimp logo">
</div>

La instalación esta disponible tanto desde la `Tienda de Software` de _Fedora_ como por terminal:

```bash
sudo dnf install gimp
```

## Inkscape

Es un editor de gráficos vectoriales gratuito y de código abierto para GNU/Linux, Windows y MacOs.

<div align="center">
  <img src="https://www.gimp.org/images/frontpage/Inkscape_Logo.svg.png" alt="inkscape logo" title="inkscape logo">
</div>

La instalación esta disponible tanto desde la `Tienda de Software` de _Fedora_ como por terminal:

```bash
sudo dnf install inkscape
```
