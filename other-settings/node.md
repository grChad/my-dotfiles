<h1 align="center">
  Node Manager (fnm)
  <img style="height:25px" src="https://github.com/gr92/my-assets/blob/main/dotfiles/icons/rs-icon.png"> +
  <img style="height:25px" src="https://github.com/gr92/my-assets/blob/main/dotfiles/icons/nodejs-icon.png">
</h1>

> Node Manager (fnm) es un administrador de versiones para **Node.js** construido en **Rust**.

## Instalación

Para instalar _fnm_ en los shells _bash, zsh_ y _fish_, use el siguiente comando de acuerdo al shell que esté utilizando. Para más detalles, consulte la documentación en _fnm_.

```bash
curl -fsSL https://fnm.vercel.app/install | zsh
```

Mas detalles en [fnm](https://github.com/Schniz/fnm).

## Uso

Para ver las versiones de Node.js disponibles, ejecute `fnm list-remote` o `fnm ls-remote`. Las versiones estables LTS son las versiones pares.

Para instalar una versión, ejecute `fnm install 16` y se instalará la última versión LTS de la serie v16.

Para ver qué versiones tiene en su sistema, ejecute `fnm ls` nos mostrara algo como esto:

<p align="center"><img src="https://github.com/gr92/my-assets/blob/main/dotfiles/terminal/fnm-ls.png"</p>

Para usar una versión diferente, ejecute `fnm use 18` y podrá utilizar la versión v18.16.0.

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

Para instalar PNPM, visite el sitio oficial de [pnpm](https://pnpm.io/), o use el siguiente comando:

```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```
