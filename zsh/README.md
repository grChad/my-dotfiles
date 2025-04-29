<h1 align="center">
  configuración de Zsh
  <img height="30px" src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733327159/shell-zsh_wmexfq.png"/>
  +
  <img height="30px" src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733327167/zimfw-logo_zdb88j.png"/>

</h1>

> Zsh es un potente y versátil intérprete de comandos de Unix con características avanzadas de auto-completado y personalización, para mas detalles visite [Z _shell_](https://zsh.sourceforge.io/).

## Instalar Zsh

Primero actualizamos nuestro sistema: `sudo dnf update`

1. Instamos zsh

   ```shell
   sudo dnf install zsh
   ```

2. Llamamos a zsh desde la terminal, solo escribimos `zsh` y nos lanzara una lista de opciones para generar el archivo de configuración `.zshrc`. Para nuestro caso elegimos una configuración vacía.
3. Ahora tenemos que asegurarnos de que _zsh_ este por default en vez de _bash_.

   ```shell
   sudo usermod --shell /usr/bin/zsh root
   sudo usermod --shell /usr/bin/zsh user
   ```

   > **user** es el usuario de tu sesión. Si no sabes cual es, escribe el comando `whoami`.
   > ejemplo: si tu **usuario** es `marcopolo`.

   ```shell
   sudo usermod --shell /usr/bin/zsh marcopolo
   ```

4. Cerramos la sesión para mostrar los cambios. Busca el botón cerrar sesión o has como un _hack_ y escribe esto en la terminal.
   ```shell
   kill -9 -1
   ```

## Instalar <img height="25px" src="https://res.cloudinary.com/dw9anhksw/image/upload/v1733327167/zimfw-logo_zdb88j.png"/>

También llamado [Zim](https://github.com/zimfw/zimfw), es un marco de configuración de Zsh que incluye un administrador de complementos , útiles módulos y una amplia variedad de temas , sin comprometer la velocidad.

Para instalar hay 2 maneras: _automática_ y _manual_, puedes revisar su repositorio y enterarte de que va. Yo realizare la Instalación _automática_ que curiosamente también se hace de 2 formas.

- Con `curl`:

  ```shell
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
  ```

- O con `wget`:
  ```shell
  wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
  ```

Eso es todo, solo cierras tu Terminal(**kitty**) y ya tendrás cosas como auto-completado, colores al escribir, búsquedas, sugerencias, promp con git, etc....

<details>
    <summary>Commandos</summary>

Para instalar algún modulo agregado al archivo _.zimrc_, es con el siguiente comando:

```shell
zimfw install
```

Para desinstalar modulo que ya no queramos con:

```shell
zimfw unistall
```

Para actualizar los módulos:

```shell
zimfw update
```

Para actualizar _Zimfw_, con:

```shell
zimfw upgrade
```

</details>

## Cepencencias:

### lsd

Con mucha frecuencia usamos el comando `ls`, que viene de _list_ o _listar_. Es de lo mas común dentro de todos los muchos y muchos comandos de UNIX.

Lsd es como un `ls`, pero con _esteroides_ o super-poderes. Usa los Glyphos de las fuentes para mostrarnos los iconos de archivos, folders, y todo ello con colores.

<p align="center">
  <img src="https://res.cloudinary.com/dw9anhksw/image/upload/v1745900149/lsd-ls_uipzrb.webp" alt="command lsdls" title="command lsd-ls"/>
</p>

Pero para ello es necesario tener una fuente con _NerdFonts_ en tu Terminal(**kitty**), dejo un enlace con las fuentes parcheadas de [NerdFonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts)

Ahora si, Para instalar **lsd**, es tan simple como escribir el comando:

```bash
sudo dnf install lsd
```

### Bat

Al igual que `lsd`, _bat_ es un `cat` pero con mejor pinta.

Para instalarlo ejecuta el comando:

```bash
sudo dnf install bat
```

Aquí dejo un ejemplo de como se vería.

<p align="center"><img src="https://res.cloudinary.com/dw9anhksw/image/upload/v1745900577/bat-cat_vof5wm.webp"/></p>

### fzf

[fzf](https://github.com/junegunn/fzf) es un buscador difuso de linea de comandos de propósito general (necesario para esta configuración).

```bash
sudo dnf install fzf
```

## Estructura del archivo .zshrc

El directorio `.zshPersonal` tendrá que ser clonado en la ruta del usuario `whoami`, en este caso **gabriel**. si tiene otro nombre de usuario cambie el nombre de las rutas `/home/gabriel/` por `/home/su-usuario/`.

### Configuración Inicial (Pre-Zimfw)

Carga variables como PATH, EDITOR, o configuraciones específicas de aplicaciones. Antes de Zimfw para asegurar que los módulos tengan acceso a estas variables.

```bash
source /home/gabriel/.zshPersonal/env.zsh
```

### Configuración de Zimfw (Autogenerada)

Bloque auto-generado por Zimfw. ¡No editar manualmente!

#### Qué hace:

Instala módulos como zsh-autosuggestions, zsh-syntax-highlighting, etc.

Define keybinds (ej: ↑/↓ para búsqueda en historial).

#### Personalización:

Usa ~/.zimrc para añadir/eliminar módulos. Ejemplo:

```bash
zmodule zsh-users/zsh-autosuggestions
zmodule asciiship
```

### Aliases y Funciones Personalizadas

Donde se encuentran nuestros alias y funciones:

```bash
source /home/gabriel/.zshPersonal/alias-func.zsh
```

### Plugins Personalizados

Aquellos plugins que no se encuentran en `Zimfw`.

```bash
source /home/gabriel/.zshPersonal/sudo.plugin.zsh
```

### Configuración Final

Últimos retoques finales para tener la configuración que nos guste.

```bash
source /home/gabriel/.zshPersonal/end-sets.zsh
```

- Configuraciones visuales (cursor, prompt).
- Overrides de plugins (ej: cambiar colores de autosuggestions).
- Carga condicional de herramientas (ej: conda, nvm).
- Ejemplo:
  ```bash
  # Cambiar estilo del cursor por modo (vi/emacs)
  echo -ne '\e[6 q'  # Cursor en modo inserción (barra)
  ```

### Todo junto:

Como se habrán dado cuenta los archivos de Configuración vienen del directorio `.zshPersonal`. La ruta debe ser clonada o usar un enlace simbólico a `/home/user/`.

```bash
# ============================[ PATH, EDITOR, etc ]============================
# Se carga en el inicio de la shell, antes que Zimfw
source /home/gabriel/.zshPersonal/env.zsh

# ==========================[ Configuración de Zim ]===========================
# Importante: no modificar este código si no lo entiende.
# Que hace: Descarga, actualiza y compila módulos (como auto-completado, sintaxis coloreada) desde tu ~/.zimrc.

# =================================[ ALIASES ]=================================
source /home/gabriel/.zshPersonal/alias-func.zsh

# =================================[ Plugins ]=================================
source /home/gabriel/.zshPersonal/sudo.plugin.zsh

# ===========================[ Configuración Final ]===========================
source /home/gabriel/.zshPersonal/end-sets.zsh

```
