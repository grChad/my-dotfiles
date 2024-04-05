<h1 align="center">
  My Dotfiles
  <img height="30px" src="https://i.ibb.co/WHmHbbx/fedora.png" title="logo linux">
</h1>

> Mi configuración para mi entorno **GNU/Linux** que me sea de utilidad. Y usando **Fedora** como distribución.

## Requisitos

Primero que nada, es recomendable tener tu distribución actualizada. Así que abres la terminal y ejecutas el comando.

```bash
sudo dnf upgrade
```

> [!NOTE]
> si ya esta por predeterminado `dnf5` en reemplazo de `dnf` usarlo en su lugar.

### Kitty <img height="25px" src="https://i.ibb.co/sKbfczF/kitty.png">:

Kitty es un emulador de terminal de código abierto y altamente configurable que ofrece características únicas como representación gráfica avanzada, soporte de imágenes y aceleración de hardware. Para mas detalles visita [kovidgoyal.net](https://sw.kovidgoyal.net/kitty/).

Se encuentra dentro del repositorio de `Fedora`, así que la instalamos así.

```bash
sudo dnf install kitty
```

También tengo una configuración de _kitty_, la puedes encontrar [aquí](./kitty)

Otra cosa que debes hacer es agregar la nueva terminal _kitty_ a un atajo de teclado o que sea la terminal por defecto de tu distribución.

### Git <img width="25px" src="https://i.ibb.co/Svsq5fD/git.png">

Git es un sistema de control de versiones distribuido para rastrear cambios en archivos y coordinar el trabajo en proyectos de desarrollo de software.

Viene por defecto en _fedora_, para otras distribuciones tendrás que acceder a su [git-scm.com](https://git-scm.com/)

### Node.js <img height="25px" src="https://i.ibb.co/R7tjy8r/nodejs-icon.png">

Es un entorno de tiempo de ejecución de JavaScript de código abierto que permite construir aplicaciones en el lado del servidor.

Instalare _Node.js_ con un administrador de versiones llamado [fnm](https://github.com/Schniz/fnm). Para ello he preparado una guia de instalación que puedes ver [aquí](./other-settings/node.md).

### ZSH <img height="20px" src="https://i.ibb.co/684JJtx/zsh.png">

Zsh es un potente y versátil intérprete de comandos de Unix con características avanzadas de autocompleted y personalización, para mas detalles visite [Z _shell_](https://zsh.sourceforge.io/).

He hecho una guia para instalar _zsh_ junto con un Framework potente y liviano llamado [zimfw](https://github.com/zimfw/zimfw). Todo ello la encuentras [aquí](./zsh)

## Editores de Código

### NeoVim <img height="25px" src="https://i.ibb.co/gvHXFT4/nvim.webp">

Es la evolución de _Vim_, un editor de texto que potencia la edición y programación con características modernas (se configura con _Lua_), extensibilidad y mayor eficiencia en la manipulación de código.

La version estable esta en el repositorio de _Fedora_ y la instalas con este comando:

```bash
sudo dnf install -y neovim python3-neovim
```

<details>
  <summary>para Nightly</summary>
  <br/>

- Habilite el repositorio `COPR` para _neovim-nightly_.

```bash
sudo dnf copr enable agriffis/neovim-nightly
```
- Hacer una actualización: `sudo dnf update`
- y para finalizar lo instalas

```bash
dnf install -y neovim python3-neovim
```
</details>

También tengo una configuración fácil para _NeoVim_ [aquí](https://github.com/grChad/nvim).

### Vs-Code <img height="25px" src="https://i.ibb.co/jrSk3Q3/vscode.png">

Visual Studio Code (VSCode) es un editor de código fuente gratuito y altamente personalizable desarrollado por Microsoft, escrita en _TypeScript_, para más detalles visita [Visual Studio Code](https://code.visualstudio.com/).

Mi configuración se encuentra [aquí](./vs-code)

### Helix <img height="23px" src="https://i.ibb.co/2hBZPLy/helix.png">

Helix se denomina a si mismo, como un editor post-moderno. Y algo de cierto tiene, hace uso de la edición modal (basado en modos) como _Vim_ o _NeoVim_, también tiene compatibilidad con LSP (language sever protocol).

1. Para instalar habilite el repositorio `COPR` para helix:
```bash
sudo dnf copr enable varlad/helix
```

2. Luego actualiza: `sudo dnf update`
```bash
sudo dnf update
```

3. Y al final lo instalas con:

```bash
sudo dnf install helix
```

Tengo una configuración para Helix, la encuentras [aquí](./helix)

## GNOME Shell Extensions

Son módulos adicionales que permiten personalizar y mejorar la experiencia del entorno de escritorio GNOME al agregar características y modificar su apariencia y comportamiento.

Visita [gnome shell extensions](https://extensions.gnome.org/).

### One Thing
One-Thing es una herramienta de productividad que le ayuda a concentrarse en una tarea a la vez.


<div align="center">
  <img src="https://i.ibb.co/9tfDDSd/one-thing.png">

  La puedes instalar desde [aquí](https://extensions.gnome.org/extension/5072/one-thing/)
</div>

### RunCat
proporciona una animación de fotograma clave en la barra superior de GNOME Shell.
La velocidad de la animación cambia según el uso de la CPU.

<div align="center">
  <img src="https://i.ibb.co/QnGHmW0/capture-run-Cat.png">

  La puedes instalar desde [aquí](https://extensions.gnome.org/extension/5072/one-thing/)
</div>

## Otros:

1. [React Native, librerías y mas](./other-settings/react-native-cli.md)
2. [Latex y mis proyectos](https://github.com/grChad/proyectos-latex)
3. [Aplicaciones para el escritorio](./other-settings/apps_desktop.md)
4. [programas para terminal](./other-settings/apps_for_terminal.md)
5. [El WiFi y sus problemas](./other-settings/wifi.md)
6. [hacks y comandos para Linux]('./other-settings/hacks-linux.md')
7. [Gravar imagen ISO desde terminal con 'dd']('./other-settings/gravarISO.md')
