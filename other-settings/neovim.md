# Nvim <img style="height: 25px" src="../assets/Nvim.png">

> Neovim es un proyecto que busca re-factorizar agresivamente Vim.

## Install

La forma mas practica es <code>**sudo apt install neovim**</code>, en el caso de debian o derivadas, en otros entornos es mas de lo mismo.
Pero el problema con esto es que encontraremos una version anticuada, por lo menos en Fedora o debian.

Así que para ello mostrare como instalar la ultima version(inestable) y la estable(actual) en **Ubuntu**(y forks) y **Fedora**.

### Instalar en Ubuntu <img style="height: 20px" src="../assets/ubuntu.png">

Tanto para la _Stable_ como para la _Nightly_ es probable que tenga que poder usar `add-apt-repository`. Para ello puede instalarlo con:

```shell
sudo apt install software-properties-common
```

Luego puede agregar el repositorio, la Stable o la Nightly. **Solo elija Una.**

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

> Tengo que asumir que usa una version superior a 25 de **Fedora**.

La version **Nightly** parece mas fácil de obtener, así que comenzare con ella.

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

Técnicamente con ello es todo. Pero nunca lo logre probar e imagino que podría instalarme una version des-actualizada. Así, pensando en ello agregare el código para compilar desde la fuente.

Primero instalar los requisitos para poder compilar.

```shell
sudo dnf install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext curl
```

Luego clone el repositorio de git

<code>**git clone https://github.com/neovim/neovim**</code>

Ingresa al folder creado `cd neovim` y cambia a la rama _Stable_:

```shell
git checkout stable
```

Si no lo cambia compilara la version _Nightly_. Ahora solo queda compilar:

```shell
sudo make install
```

### Problemas con el porta-papeles de Nvim:

Para usuarios del compositor gráfico X11:

```shell
sudo apt install xclip
```

Y para usuarios de _Wayland_, `En Fedora 36, ya no necesitaba instalarlo`.

```shell
sudo dnf isntall wl-clipboard
```

Pero es importante que en su configuración tenga habilitado el uso del clipboard

### Problema con la compilación de Nvim TreeSitter

Primero me salio un error que decía:

```bash
/usr/bin/ld: cannot find -lstdc++
collect2: error: ld returned 1 exit status
```

- Para solucionarlo instale lo siguiente: `sudo dnf install libstdc++-static`

Luego me dio otro error:

```bash
Gcc error: gcc: error tryin to exec
'cc1': execvp: No such file or directory
```

- Y se soluciono instalando lo siguiente: `sudo dnf install gcc-c++`
