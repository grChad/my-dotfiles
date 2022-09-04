 # Programas para la Terminal <img style="height:25px" src="../assets/shell-icon.png">

## Grex: <img style="height: 17px" src="../assets/image-grex.png">
grex es una biblioteca, así como una utilidad de línea de comandos que pretende simplificar la tarea a menudo complicada y tediosa de crear expresiones regulares. Lo hace generando automáticamente una única expresión regular a partir de casos de prueba proporcionados por el usuario. Se garantiza que la expresión resultante coincida con los casos de prueba a partir de los cuales se generó.

### Install
```bash
cargo install grex
```

Aunque también funciona con:

<code>**(brew | cargo | choco | huber | scoop) install grex**</code>

### usar
Tan facil como  colocar en la **_terminal_**, <code>**grex hola mola**</code> y obtendrias algo como <code>**^\[hl]ola$**</code>, que es la expresion regular.

<p align="center"><img src="../assets/image-grex-terminal.png"></p>

También podrías tener las coincidencias en un archivo y buscar a través de ellas:
<code>**grex -f file.txt**</code> y obtener el mismo resultado.

<p align="center"><img src="../assets/image-grex-file.png"></p>

Para mas informacion en el **_GitHub_** de [**grex**](https://github.com/pemistahl/grex).

## pfetch
Es una bonita herramienta de información del sistema escrita en POSIX sh. Utilizando funciones integradas en el propio lenguaje

### Install Unix/Linux
+ con [_wget_](https://www.gnu.org/software/wget/?) o con [_git_](https://git-scm.com/), **Solo elige uno!**
```shell
wget https://github.com/dylanaraps/pfetch/archive/master.zip
git clone https://github.com/dylanaraps/pfetch.git
```

Si usaste _wget_, tienes que descomprimir el archivo **.zip**
```shell
unzip master.zip
```

Instale el binario usando el comando install:
```shell
sudo install pfetch-master/pfetch /usr/local/bin/
```

Ahora prueve con el comando **_pfetch_**.

<p align="center"><img src="../assets/image-pfetch.png"></p>

## winehq
Wine permite correr software de _Windows_ en **_linux_**. Con Wine se puede instalar y correr aplicaciones igual que se hacia en _windows_ y la puedes descargar desde [**_aqui_**](https://wiki.winehq.org/Download).

### uso
Dar click en un programa **.exe** de _windows_ y solo eso, claro que al inicio pueda necesitar instalar otros programas...
