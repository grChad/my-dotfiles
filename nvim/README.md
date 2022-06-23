# Configuracion Personal <img style="height: 30px; background-color: #F3D9B4; border-radius: 3px" src="../assets/Nvim-complete.png">
## Requisitos Linux
* **NVim 0.7.0**: Compilar desde **[HitHub/Nvim](https://github.com/neovim/neovim)**, o descargar la version **.deb**
* **NodeJs**: Seguir esta **[guia](../other-settings/node.md)**
  - Para **Fedora**, es mejor instalarlo desde **[Package Snap](https://snapcraft.io/node)**.
* **Git**: **[Official Page](https://git-scm.com/)**.
``` bash
# Para distribuciones basados en DEBIAN
sudo apt install git

# Para FEDORA
sudo dnf isntall git
```

## Lsp-config
Lista de servidores de uso personal, Para mas detalles: **[nvim-lspconfig language servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)**.
```lua
local servers = {
  'tsserver', 'emmet_ls', 'html', 'cssls', 'jsonls', 'eslint', 'stylelint_lsp',
  'sumneko_lua', 'rust_analyzer', 'vimls', 'pyright', 'svelte', 'tailwindcss'
}
```

## Nvim-treesitter
Resaltado de syntaxis para los código **[nivm-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**.
* Una ves Instalado: **TSInstall all**, la configuracion ignorara algunos Lenguajes.
``` lua
require('nvim-treesitter.configs').setup {
  ignore_install = { 'vim', 'scss' },
  highlight = {
    disable = { 'vim', 'scss' },
  },
}
```
