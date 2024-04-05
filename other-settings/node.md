<h1 align="center">
  Node Manager (fnm)

  <img style="height:30px" src="https://i.ibb.co/HXw52pZ/rs-logo.png"> +
  <img style="height:30px" src="https://i.ibb.co/B6tfy0p/nodejs-logo.png">
</h1>

> Node Manager (fnm) es un administrador de versiones para **Node.js** construido en **Rust**.

## Instalación

Para instalar _fnm_ en los shells _bash, zsh_ o _fish_, use el siguiente comando de acuerdo al shell que esté utilizando. Para más detalles, consulte la documentación en [fnm](https://github.com/Schniz/fnm).

```bash
curl -fsSL https://fnm.vercel.app/install | zsh
```

## Uso

Para ver las versiones de Node.js disponibles, ejecute `fnm list-remote` o `fnm ls-remote`. Las versiones LTS son las versiones pares.

Para instalar una versión como la `20 LTS`, ejecute `fnm install 20` y se instalará la última versión LTS de la serie v20.

Para ver qué versiones tiene en su sistema, ejecute `fnm ls` nos mostrara algo como esto:

<div align="center"><img src="https://i.ibb.co/c3cGjr0/capture-fnm-ls.png"></div>

Para usar una versión diferente como la `V21`, ejecute `fnm use 21` y podrá utilizar la versión v21.7.1

<div align="center"><img src="https://i.ibb.co/8MRJr6N/capture-fnm-use.png"></div>

Para utilizar una versión en un proyecto específico, agregue la versión que desea usar en el archivo `.node-version` o `.nvmrc`, por ejemplo:

```bash
echo '18' >> .nvmrc
```

Para ser más específico con la versión, especifique en el archivo `.nvmrc`:

```bash
echo '18.16.0' >> .nvmrc
```

También deberá agregar `eval "$(fnm env --use-on-cd)"` en su archivo _.zshrc_. Para otros casos como bash y fish, consulte el [repositorio de fnm](https://github.com/Schniz/fnm).

Para más información sobre fnm, consulte este [articulo](https://www.freecodecamp.org/news/fnm-fast-node-manager/).

## Instalación de PNPM

PNPM es una alternativa al administrador de packetes de Node.js (npm), es mas rapido y cada ves se hace mas popular.

Para instalar PNPM, use los siguientes comandos:

Instalar con **curl**

```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

O instalar con **wget**

```bash
wget -qO- https://get.pnpm.io/install.sh | sh -
```
