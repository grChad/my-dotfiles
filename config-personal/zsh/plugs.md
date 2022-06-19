# How install plugs in Shell
* Algunas extenciones sera desde repositorios, otras se compilaran y otras desde el instalador de **zimfw** o mas...
## Compiladas
* **gokcehan/lf**: Administrador de ficheros escrito en **Go** y con un estilo similar a Ranger.
  - Se compila con [Go](https://go.dev/), asi que es requisito tenerlo instalado.
  - la compilacion para Unix (Go version >= 1.17)
  - env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

## Por Wget
* **sudo**: Para completar el sudo al pulsar *'Esc'* 2 veces.
  - crear un forlder ***zsh-sudo*** en /usr/share/
  - **cd /usr/share/zsh-sudo** *wget* ruta de raw de **sudo.plugin.zsh** en github
  - Permiso en el archivo: **sudo chmod -x sudo.plugin.zsh**
  - **cd ..**, permiso al folder padre: **sudo chown** ***gabriel:gabriel -R zsh-sudo***

## Desde el isntalador de **ZimFw**
* **zsh-syntax-highlighting**: Sintaxis agradable para busqueda en el shell, esta por defecto en **zimfw**
* **zsh-history-substring-search**: Historial de busquedas para la teminal, por defecto en **zimfw**
* **zsh-autosuggestions**: Sugerencias de completado inteligente, por defecto en **zimfw**
* **Theme PowerLevel10k**: Thema para la terminal
  - cd && vi .zimrc
  - colocar: zmodule romkatv/powerlever10k --use degit
  - white and exit.
  - white in shell: zimfw install

## Desde archivos **.dev** || Tambien desde repositorio
* **lsd**: Iconos y thema para lis listados en zsh, Le da bida a la terminal
  - download package desde el repositorio de **Peltoche/lsd**
  - desde la terminal **sudo dpkg -i PWD/lsd-musl_amd64.deb**
* **bat**: Es una version de cat del shell pero con esteroides.
  - sudo apt update
  - sudo apt install **bat**
  - puede estar con el nombre de batcat, asi que en el alias se podria colocar como: **alias cat='batcat'**.
