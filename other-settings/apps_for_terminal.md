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

Tan facil como colocar en la **_terminal_**, <code>**grex hola mola**</code> y obtendrias algo como <code>**^\[hl]ola$**</code>, que es la expresion regular.

<p align="center"><img src="../assets/image-grex-terminal.png"></p>

También podrías tener las coincidencias en un archivo y buscar a través de ellas:
<code>**grex -f file.txt**</code> y obtener el mismo resultado.

<p align="center"><img src="../assets/image-grex-file.png"></p>

Para mas informacion en el **_GitHub_** de [**grex**](https://github.com/pemistahl/grex).

## pfetch

Es una bonita herramienta de información del sistema escrita en POSIX sh. Utilizando funciones integradas en el propio lenguaje

### Install Unix/Linux

- con [_wget_](https://www.gnu.org/software/wget/?) o con [_git_](https://git-scm.com/), **Solo elige uno!**

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

## webP

para reducir las imagenes sin perder calidad y en formato webp

## Flutter SDK

Puedes instalar Flutter desde el [sitio oficial](https://docs.flutter.dev/get-started/install/linux), tanto manual como por Snap.

<details>
    <summary>Snap</summary>

```shell
sudo snap install flutter --classic
```

</details>

<details>
    <summary>Instalar manualmente</summary>

1. Descargue el siguiente paquete de instalación para obtener la última versión estable del SDK de Flutter [Aquí](https://docs.flutter.dev/release/archive?tab=linux)
2. Extraiga el archivo en la ubicación deseada. Por ejemplo:

   ```bash
   cd ~/development
   tar xf ~/Downloads/flutter_linux_3.10.6-stable.tar.xz
   ```

3. Añade el Path de flutter en tu **.zsrhc**:
   ```shell
   export PATH=$HOME/`pwd`/flutter/bin:$PATH
   ```
4. Opcionalmente, pre-descargue los binarios de desarrollo:
   ```shell
   flutter precache
   ```

¡Ya estás listo para ejecutar los comandos de Flutter!

</details>

### Ejecute Flutter doctor

Ejecute el siguiente comando para ver si hay alguna dependencia que necesite instalar para completar la configuración (para una salida detallada, agregue el flag -v):

```shell
flutter doctor
```

Este comando verifica su entorno y muestra un informe en la ventana del terminal. El SDK de Dart se incluye con Flutter; no es necesario instalar Dart por separado. Verifique la salida cuidadosamente para ver si hay otro software que pueda necesitar instalar o realizar otras tareas (que se muestran en negrita).

Por ejemplo:

```shell
[-] Android toolchain - develop for Android devices
    • Android SDK at /Users/dash/Library/Android/sdk
    ✗ Android SDK is missing command line tools; download from https://goo.gl/XxQghQ
    • Try re-installing or updating your Android SDK, visit https://docs.flutter.dev/setup/#android-setup for detailed instructions.

```
