# Configuracion Personal <img style="height: 30px" src="../assets/Nvim-complete.png">
## Requisitos Linux
* **NVim 0.7.0** o **nightly**: Compilar desde **[HitHub/Nvim](https://github.com/neovim/neovim)**, o descargar la version [**.deb**](https://github.com/neovim/neovim/releases) -> <code>**sudo apt install ./nvim-linux64.deb**</code>
* **NodeJs**: Seguir esta **[guia](../other-settings/node.md)**
* **Git**: para **Debian** <img style="height: 15px" src="../assets/debian-icon.png"> y **Fedora** <img style="height: 15px" src="../assets/fedora-linux-icon.png"> <code>**sudo { apt, dnf } install git**</code>, para lo demas -> **[Official Page](https://git-scm.com/)**.

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
