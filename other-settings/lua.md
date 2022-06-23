# install lua en el equipo:
* lo de la sintaxis se ve con **treesitter**.
* el servidos de idiomas **lsp**, se instala manualmente:
  - Como uso fedora: dnf install libstdc++-static
  - git clone <https://github.com/sumneko/lua-language-server>
  - cd lua-language-server
  - git submodule update --init --recursive
* penultimo paso:
  - cd 3rd/luamake
  - ./compile/install.sh
  - cd ../..
  - ./3rd/luamake/luamake rebuild
* Ultimo paso a usar:
  - el binario se encuentra en la ruta: **./bin/lua-language-server**
## Install love2D in Linux
* En la pagina oficial de **love2D**, descargar por UbuntuPPA
* sudo app-apt-repository ppa:bartbes/love-stable
* sudo apt update, if list --upgradable: sudo apt upgrade
* sudo apt install love
