# Aplicaciones para el Equipo

> Aplicaciones o programas que sequieren mas seguimiento para inslatar.

## Love2D

Love es un marco _increible_ que puedes usar para hacer juegos 2D en lua. Es gratis, de código abierto y funciona desde _windows, Mac Os X, Linux, Android e Ios_.

### install

- En **Ubuntu** <img style="height: 15px" src="../assets/ubuntu.png">, se instala a travez de un **PPA**.

```bash
sudo add-apt-repository ppa:bartbes/love-stable
sudo apt update
```

- En **Fedora** <img style="height: 15px" src="../assets/fedora-linux-icon.png">, se instala a travez a travez de **dnf**.

```shell
sudo dnf makecache --refresh
sudo dnf -y install love
```

Eso es todo. Ahora en la terminal puedes llamarlo **`love`** y veras algo como esto.

<p align="center"><img src="../assets/image-love2d.png"></p>

... end.

## fontforge

Un programa para editar una fuente o modificar una que ya tengas descargada:

```shell
dnf search fontforge
```

Te saldrá tanto la version normal para sistemas `.x86_64` o `.i686` para 32 bits. Luego solo queda Instalarlo:

```shell
sudo dnf install fontforge
```
