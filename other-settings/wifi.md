## Configuración de Wi-Fi en Fedora

Si necesitas configurar el Wi-Fi en tu equipo Fedora, sigue los siguientes pasos:

1. Asegúrate de tener tu equipo actualizado y verifica el controlador que utiliza ejecutando el comando `lspci | grep -i network`.

2. Si utilizas un controlador Broadcom BCM43228 802.11a/b/g/n, necesitas instalar los controladores `broadcom-wl`.

3. Habilita los repositorios libres y no libres de rpmfusion con el siguiente comando:

```shell
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

4. Instala los controladores `broadcom-wl` con el siguiente comando:

```shell
sudo dnf install broadcom-wl
```

5. Reinicia tu equipo como un _hack_ ejecutando el siguiente comando:

```shell
sudo init 6
```

Después de reiniciar, deberías poder conectarte a Wi-Fi en tu equipo Fedora.

## Configuración de Wi-Fi en Debian

Si necesitas configurar el Wi-Fi en tu equipo Debian, sigue los siguientes pasos:

1. Elimina el controlador `bcmwl-kernel-source` con el siguiente comando:

```shell
sudo apt remove bcmwl-kernel-source
```

2. Instala el firmware `b43-installer` con el siguiente comando:

```shell
sudo apt install firmware-b43-installer
```

Después de instalar el firmware, deberías poder conectarte a Wi-Fi en tu equipo Debian.
