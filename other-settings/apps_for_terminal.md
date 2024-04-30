<h1 align="center">Programas para la Terminal</h1>

## <img width="80px" src="https://raw.githubusercontent.com/pemistahl/grex/main/logo.png">

Grex es una biblioteca, así como una utilidad de línea de comandos que pretende simplificar la tarea a menudo complicada y tediosa de crear expresiones regulares.

### Install

Usando `cargo` de _Rust_.

```shell
cargo install grex
```

Aunque también funciona con:

<code>**(brew | cargo | choco | huber | scoop)** install grex</code>

### usar

Tan fácil como colocar en la terminal, `grex hola mola` y obtendrías algo como `^\[hl]ola$`, que es la expresión regular.

<div align="center"><img src="../assets/capture-grex-hola-mola.png"></div>

También podrías tener las coincidencias en un archivo y buscar a través de ellas:
`grex -f file.txt` y obtener el mismo resultado.

<div align="center">
  <img src="../assets/capture-cat-file.png">
  <img src="../assets/capture-grex-file.png">
</div>

Para mas información en [grex](https://github.com/pemistahl/grex).

## webP

WebP es un formato de imagen moderno que proporciona una compresión con y sin pérdida superior para imágenes en la Web. Con WebP, los webmasters y los desarrolladores web pueden crear imágenes más pequeñas y enriquecidas que hacen que la Web sea más rápida.

Para instalarlo desde el repositorio de _Fedora_, ejecutamos el siguiente comando.

```shell
sudo dnf install libwebp
```

#### Uso

Usa _cwebp_ en la línea de comandos para convertir archivos de imagen PNG o JPEG al formato WebP. Puedes convertir un archivo de imagen PNG en una imagen WebP con un rango de calidad de 80 con el siguiente comando:

```shell
cwebp -q 80 image.png -o image.webp
```

Usa _dwebp_ en la línea de comandos para convertir los archivos de imagen WebP al formato PNG o PPM. Puedes convertir un archivo de imagen WebP, por ejemplo, image.webp, en una imagen PNG con el siguiente comando:

```shell
dwebp image.webp -o image.png
```

## unrar

Es una utilidad para descomprimir archivos que se encuentran comprimidos en formato _RAR_. Para _Linux_ y en _Fedora_, encontramos un equivalente con el mismo nombre.

Lo instalamos usando el siguiente comando.

```shell
sudo dnf install unrar
```

#### Uso

1. Para descomprimir un archivo _.rar_ es tan simple como:
   ```shell
   unrar e name_file.rar
   ```
2. Para descomprimirlo pero, en una ruta determinada.
   ```shell
   unrar e name_file.rar ~/path/directory/
   ```
3. Para verificar si un archivo _.rar_ se encuentra dañado o tiene algún problema.
   ```shell
   unrar t name_file.rar
   ```

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

   ```shell
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

## Love2D
LÖVE es un marco _increíble_ que puedes usar para hacer juegos 2D en Lua. Es gratis, de código abierto y funciona desde _windows, Mac Os X, Linux, Android e Ios_.

En _Fedora_, se instala a través de la paquetería `dnf`.

```bash
sudo dnf makecache --refresh
sudo dnf install love
```

Eso es todo. Ahora en la terminal puedes llamarlo **`love`** y veras algo como esto.

<div align="center">
  <img src="../assets/capture-love.webp" alt="image of the app love2D" title="image of the app love2D">
</div>

## MySQL
> [!NOTE]
> la instalación viene de la información brindada de [docs](https://docs.fedoraproject.org/e-US/quick-docs/installing-mysql-mariadb/) de _fedoraproject.org_.

### Agregar el repositorio MySQL a Fedora
Descargue el paquete de versión proporcionado por Oracle desde [aquí](https://dev.mysql.com/downloads/repo/yum/) Una vez descargado, instalar usando `dnf`:

```shell
sudo dnf install <ruta absoluta del archivo>
```

### Instalación de MySQL en Fedora

```shell
sudo dnf install mysql-community-server
```

### Inicie el servicio MySQL y habilitar al iniciar sesión:

```shell
sudo systemctl start mysqld
sudo systemctl enable mysqld
```

busque la contraseña predeterminada. Por razones de seguridad, MySQL genera una clave raíz temporal.  Tenga en cuenta que MySQL tiene políticas de seguridad aún más estrictas que MariaDB.

###  Configurar MySQL antes del primer uso

```shell
sudo mysql_secure_installation
```

Luego, responde las preguntas de seguridad como prefieras.  o simplemente decir sí a todos ellos.

### usar MySQL

```shell
sudo mysql -u root -p
```

### remover MySQL
Sugiero eliminar de la siguiente manera, la forma más adecuada y segura sin eliminar muchas dependencias es:

```shell
sudo rpm -e --nodeps mysql-community-libs mysql-community-common mysql-community-server
```
