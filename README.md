<h1 align="center">
  My Dot-files
  <img 
    src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733327148/fedora-linux-icon_gswdid.png"
    height="30px" title="logo de Fedora" alt="logo de Fedora"
  >
</h1>

> Mi configuración para mi entorno **GNU/Linux** que me sea de utilidad. Y usando **Fedora** como distribución.

## Requisitos

Primero que nada, es recomendable tener tu distribución actualizada. Así que abres la terminal y ejecutas el comando.

```bash
sudo dnf upgrade
```

> [!NOTE]
> si ya esta por predeterminado `dnf5` en reemplazo de `dnf` usarlo en su lugar.

### Kitty <img height="25px" src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733327153/kitty_nwsuzj.png">

Kitty es un emulador de terminal de código abierto y altamente configurable que ofrece características únicas como representación gráfica avanzada, soporte de imágenes y aceleración de hardware. Para mas detalles visita [kovidgoyal.net](https://sw.kovidgoyal.net/kitty/).

Se encuentra dentro del repositorio de `Fedora`, así que la instalamos así.

```bash
sudo dnf install kitty
```

Otra cosa que debes hacer es agregar _kitty_ a un atajo de teclado o que sea la terminal por defecto de tu distribución.

<details>
  <summary><code>comandos favoritos</code></summary>

```bash
# Visualizar imágenes desde la terminal
kitten icat image.png

# Lista de fuentes disponibles para kitty
kitty +list-fonts
```

</details>

También tengo una configuración de _kitty_, la puedes encontrar [aquí](./kitty)

### Git <img width="25px" src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733327149/git-icon_lukouu.png">

Git es un sistema de control de versiones distribuido para rastrear cambios en archivos y coordinar el trabajo en proyectos de desarrollo de software.

Viene por defecto en _fedora_, para otras distribuciones tendrás que acceder a su [git-scm.com](https://git-scm.com/)

### ZSH <img height="20px" src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733327159/shell-zsh_wmexfq.png">

Zsh es un potente y versátil intérprete de comandos de Unix con características avanzadas de autocompleted y personalización, para mas detalles visite [Z _shell_](https://zsh.sourceforge.io/).

He hecho una guia para instalar _zsh_ junto con un Framework potente y liviano llamado [zimfw](https://github.com/zimfw/zimfw). Todo ello la encuentras [aquí](./zsh)

### Node.js <img height="25px" src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733327155/nodejs-icon_s9sdas.png">

Es un entorno de tiempo de ejecución de JavaScript de código abierto que permite construir aplicaciones en el lado del servidor.

Instalare _Node.js_ con un administrador de versiones llamado [fnm](https://github.com/Schniz/fnm). Para ello he preparado una guia de instalación que puedes ver [aquí](./other-settings/node.md).

## Editores de Código

### NeoVim <img height="25px" src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733327045/Nvim_foxbab.png">

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

### Vs-Code <img height="25px" src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733327164/visual-studio-code-icon_z5tqbs.png">

Visual Studio Code (VSCode) es un editor de código fuente gratuito y altamente personalizable desarrollado por Microsoft, escrita en _TypeScript_, para más detalles visita [Visual Studio Code](https://code.visualstudio.com/).

Mi configuración se encuentra [aquí](./vs-code)

### Helix <img height="23px" src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733327151/helix_pwbaqu.png">

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
  <img src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733329282/one-thing_rezpgp.png">

La puedes instalar desde [aquí](https://github.com/one-thing-gnome/one-thing)

</div>

### Simple Message

Similar a [One Thing](#one-thing), pero mas simple y se requiere de una configuración en _zsh_ para tener la experiencia completa.

La puedes instalar desde [aquí](https://github.com/freddez/gnome-shell-simple-message)

<details>
  <summary>Configuración recomendada para Zsh</summary>

```bash
DCONF_WRITE_COMMAND="dconf write /org/gnome/shell/extensions/simple-message/message"
function show_message() {
  local message="$1"

  if [ -n "$message" ] && [ "$message" != "ms" ]; then
    eval "$DCONF_WRITE_COMMAND \"\\\"$message\\\"\""
    echo "Se ha agregado el mensaje $(tput setab 0)$(tput setaf 6) $message "
  else
    # Borrar el mensaje
    eval "$DCONF_WRITE_COMMAND \"\\\"\\\"\""
    echo "Mensaje eliminado"
  fi
}
alias ms='show_message'
```

</details>

Ahora solo tienes que usar el comando `ms` seguido de tu mensaje en comillas simples `'mensaje'` o `"mensaje"` y eso es todo.

<div align="center">
  <img 
    src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733329551/simple-message-terminal_jtya91.png"
  >
  <img 
    src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733329552/simple-message-titleBar_yxcofz.png"
  >
</div>

### RunCat

Proporciona una animación de fotograma clave en la barra superior de GNOME Shell.
La velocidad de la animación cambia según el uso de la CPU.

<div align="center">
  <img src="https://github.com/win0err/gnome-runcat/raw/master/assets/runcat-header.gif">
  <p>
    La puedes instalar desde
    <a href="https://github.com/win0err/gnome-runcat">aquí</a>
  </p>
</div>

### Tiling Shell <img src="https://raw.githubusercontent.com/domferr/tilingshell/main/logo.png" height="25">

Una extension avanzada para administrar ventanas como 'Tiling'.

<div align="center">
  <img 
    src="https://github.com/domferr/tilingshell/raw/main/doc/horiz_summary.jpg"
    width="700" alt="image of tiling shell" title="tiling shell"
  >
  <p>
    La puedes instalar desde
    <a href="https://github.com/domferr/tilingshell">aquí</a>
  </p>
</div>

## Otros:

1. [React Native, librerías y mas](./other-settings/react-native-cli.md)
2. [Depuración WIFI](./other-settings/depuracion-wifi.md)
3. [Configurar el entorno de LaTeX](./other-settings/latex.md)
4. [Proyectos con LaTeX](https://github.com/grChad/proyectos-latex)
5. [Aplicaciones para el escritorio](./other-settings/apps_desktop.md)
6. [herramientas para terminal](./other-settings/tools-terminal.md)
7. [El WiFi y sus problemas](./other-settings/wifi.md)
8. [hacks y comandos para Linux](./other-settings/hacks-linux.md)
9. [Gravar imagen ISO desde terminal](./other-settings/gravarISO.md)
10. [Agregar glyphos a una fuente](./other-settings/nerdfonts-patcher.md)
