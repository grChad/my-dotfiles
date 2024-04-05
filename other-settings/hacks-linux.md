<h1 align="center">Hacks y comandos para Linux</h1>

## Para cambiar de shell a zsh:

```shell
cd
sudo su
usermod --shell /usr/bin/zsh gabriel
usermod --shell /usr/bin/zsh root
```

## Para Fedora <img height="20px" src="../assets/fedora-linux-icon.png">
+ `sudo dnf search -v app`: Con esto busco si el programa que deseo instalar, esta disponible, la version y mas detalles.
+ `sudo dnf config-manager --set-disabled repo`: Para desabilitar algun repositorio
+ `dnf repolist`: Para listar los repositorios activos.
