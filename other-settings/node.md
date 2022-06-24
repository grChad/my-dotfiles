# Node Manager (fnm) </span><img style="height:25px" src="../assets/rust-language.png"> + <img style="height:25px" src="../assets/nodejs.png">
> Administrador de Versiones para **NodeJs** Construido en **Rust**.
## Instalación:
Al momento para **bash, zsh y fish**, dependiento del shell que se usa se agrega o cambia (default: **zsh**).

Mas detalles en [**fnm**](https://github.com/Schniz/fnm).

``` bash
curl -fsSL https://fnm.vercel.app/install | zsh
```
## Uso:
Para ver las versiones de <img style="height:15px" src="../assets/nodejs-icon.png"> **node** disponibles: <code>**fnm list-remote**</code> o tambien <code>**fnm ls-remote**</code>.

Las versiones estables (**LTS**) son las versiones pares.

Para descargar una version: <code>**fnm install 16**</code>, y se intalara una **LTS**. Para la ultima version a la fecha <code>**fnm install 18**</code> (**Todavia no es LTS**).

Para ver que versiones tenemos en el sistema: <code>**fnm ls**</code>, nos dara una lista como esta:
``` bash
* v16.15.1 default
* v18.4.0
* system
```
Para usar una version diferente: <code>**fnm use 18**</code> y podra usar la version **V18.4.0**..

Para usar una version en un proyecto en **.node-version** o tambien en **.nvmrc**. Ejemplo:
```bash
$ node --version
v18.4.0
$ node --version > .node-version
```
Tambien tendra que agregar lo siguiente a **.zshrc**: <code>**eval "$(fnm env --use-on-cd)"**</code>. Para otros casos como **bash** y **fish** revisar en el [**repositorio de fnm**](https://github.com/Schniz/fnm).
