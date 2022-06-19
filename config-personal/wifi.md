## Para Fedora
* La version de mi controlador es b43228
* Se tiene que tener actualizado el equipo: sudo dnf update
* La unica forma que encontre fue la siguiente.
   - sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
* comienza a instalarce, son como 28k.
   - sudo dnf search kmod-wl
   - sudo dnf info kmod-wl
   - sudo dnf update 0 sudo yum update 
   - reiniciar: sudo reboot 0 init6
   - sudo dnf install kmod-wl
   - la instalacion se pesa como 63MB.
* reiniciar por ultima vez: sudo reboot 0 init6
* se puede verificar con los siguientes comandos:
   - ifconfig
   - ip a s
   - iwconfig
   - sudo lshw -C network -short
   - nmcli -f GENERAL,WIFI-PROPERTIES dev show wlp1s0
* Eso es todo, mas complicado que en debian pero es asi...END...

## Para Debian
sudo apt remove bcmwl-kernel-source
sudo apt install firmware-b43-installer
