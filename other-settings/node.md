# <span style="color:#0074d9">Node Manager (fnm) </span><img style="height:25px" src="../assets/rust-language.png"> + <img style="height:25px" src="../assets/nodejs.png">
> Administrador de Versiones para **NodeJs** Construido en **Rust**.
## Instalación:
Al momento para **bash, zsh y fish**, dependiento del shell que se usa se agrega o cambia (default => zsh).

Pagina de **[fnm en HitHub](https://github.com/Schniz/fnm)**

``` bash
curl -fsSL https://fnm.vercel.app/install | zsh
```
## Uso:
Para ver las versiones de **node** disponibles: <code style="background: #D4F2FF">**fnm list-remote**</code> o tambien <code style="background: #D4F2FF">**fnm ls-remote**</code>.

Las versiones estables (**LTS**) son las pares.

Para descargar una version: <code style="background: #D4F2FF">**fnm install 16**</code>, y se intalara una **LTS**. Para la ultima version a la fecha <code style="background: #D4F2FF">**fnm install 18**</code> (**Todavia no es LTS**).

Para ver que versiones tenemos en el sistema: <code style="background: #D4F2FF">**fnm ls**</code>, nos dara una lista como esta:
``` bash
* v16.15.1 default
* v18.4.0
* system
```
Para usar una version diferente: <code style="background: #D4F2FF">**fnm use 18**</code> y podra usar la version **V18.4.0**..

Para usar una version en un proyecto en **.node-version** o tambien en **.nvmrc**. Ejemplo:
```bash
$ node --version
v14.18.3
$ node --version > .node-version
```
Tambien tendra que agregar lo siguiente a **.zshrc**: <code style="background: #D4F2FF">**eval "$(fnm env --use-on-cd)"**</code>. Para otros casos como **bash** y **fish** revisar en el **[repositorio de fnm](https://github.com/Schniz/fnm)**.
