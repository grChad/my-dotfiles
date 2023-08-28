# Nvim <img style="height: 25px" src="../assets/Nvim.png">

> Neovim es un proyecto que busca refactorizar agresivamente Vim.

## Install

la forma mas practica es <code>**sudo apt install neovim**</code>, en el caso de debian o derivadas, en otros entornos es mas de lo mismo.
Pero el problema con esto es que encontraremos una version anticuada, por lo menos en Fedora o debian.

Asi que para ello mostrare como instalar la ultima version(inestable) y la estable(actual) en **Ubuntu**(y forks) y **Fedora**.

### Instalar en Ubuntu <img style="height: 20px" src="../assets/ubuntu.png">

Tanto para la **Stable** como para la **Nightly** es problable que tenga que poder usar <code>**add-apt-repository**</code>. Para ello puede instalarlo con:

```shell
sudo apt install software-properties-common
```

luego puede agregar el repositorio, la Stable o la Nightly. **Solo elija Una.**

```shell
sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repositorio ppa:neovim-ppa/unstable
```

Luego de que halla agregado uno de los repositorios toca un update e instalarlo.

```shell
sudo apt update
sudo apt install neovim
```

### Instalar en fedora <img style="height: 20px" src="../assets/fedora-linux-icon.png">

> Tengo que asumir que usa una versin superior a 25 de **Fedora**.

La version **Nightly** parece mas facil de obtener, asi que comenzare con ella.

Primero habilita el repositorio agriffis de **copr**, y luego instala.

```shell
sudo dnf copr enable agriffis/neovim-nightly
sudo dnf update
sudo dnf install -y neovim python3-neovim
```

Ahora para la version **Stable**:

```shell
sudo sudo dnf install -y neovim python3-neovim
```

Tecnicamente con ello es todo. Pero nunca lo logre probar e imagino que podria instalarme una version desactualizada. Asi, pensando en ello agregare el codigo para compilar desde la fuente.

Primero instalar los requisitos para poder compilar.

```shell
sudo dnf install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext curl
```

Luego clone el repositorio de git

<code>**git clone https://github.com/neovim/neovim**</code>

Ingresa al folder creado <code>**cd neovim**</code>, y para cambiar a la rama **Stable** usa:

```shell
git checkout stable
```

si no lo cambia compilara la version **Nightly**. Ahora solo queda compilar:

```shell
sudo make install
```

## Problemas con el portapapeles de Nvim:

Para usuarios del compositor grafico X11:

```shell
sudo apt install xclip
```

Y para usuarios de Wayland, <code>En Fedora 36, ya no necesitaba instalarlo</code>.

```shell
sudo dnf isntall wl-clipboard
```

Pero es importante que en su configuracion tenga habilitado el uso del clipboard

### Problema con la conpilacion de NvimTreeSitter

Primero me salio un error que decia:

```shell
/usr/bin/ld: cannot find -lstdc++
collect2: error: ld returned 1 exit status
```

- Para locucionarlo instale lo siguiente: <code>**sudo dnf install libstdc++-static**</code>

Luego me dio otro error:

```shell
Gcc error: gcc: error tryin to exec
'cc1': execvp: No such file or directory
```

- Y se soluciono instalando lo siguiente: <code>**sudo dnf install gcc-c++**</code>

... end.

### ayuda para nvim

Instalando lo siguiente.

```bash
sudo dnf install aspell-es aspell-en
```
