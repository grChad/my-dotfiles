# Sobre Nvim <img style="height: 25px" src="../assets/Nvim.png">
## Formas de instalar
por repositorio, por lo menos en **Debean**:
```shell
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

## Primero complir con todos los requisitos
* Install git **apt install git, dnf install git, pacman -Sy git...**
* Para compilar el proyecto se tendran que instalar las dependencias.
   - [Apt, dnf, pacman -Sy, ...] install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext curl
* Clonar el repositorio completo de **Nvim** de preferencia en *cd/*
   - git clone <https://github.com/neovim/neovim>
* cd neovim
* git checkout stable.
* sudo make install
   - Se instalara por default en */usr/local*

## [Correccion de Problemas]
* [coc.nvim] Error on execute python script: request error nvim_comand -
Vim(pyxfile):E319: No "python3" provider found.
* aparece al iniciar nvim
* solucion 1: al inicio de la configuracion de coc.vim agregar:
   - let g:python3_host_prog='/usr/bin/python3'
* si persiste:
   - cd
   - sudo dnf install pip
   - python3 -m pip install pynvim


## Problemas no relacionados con nvim:
* no se podica copiar y pegar fuera de nvim usando wayland. Pase por mucho para encontrar el error.
* la solucion fue ejecutar:
   - echo 'some text' | wl-copy
* el resultado fue que me recomendo instalar:
   - install package 'wl-clipboard' to provide command 'wl-copy'
* Le di que si y se instalo.
* lo bueno es que llegue a tiempo para usar la mejora de nvim, ya que antes tendria que realizar un paso adicional:
   - kxnoremap "+y y:call system("wl-copy", @")<cr>
   - nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
   - nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>pj
* tambien esta este trabajo para cuando tenga un problema similar con el
   clipboard: <https://github.com/jasonccox/vim-wayland-clipboard>

* **Clipbard en x11**: para Pop-Os se instala **xclip** <code>**sudo apt install xclip**</code>
