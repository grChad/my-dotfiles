local new_command = vim.api.nvim_create_user_command

new_command('PackerInstall', 'packadd packer.nvim | lua require("plugins").install()', {})
new_command('PackerUpdate', 'packadd packer.nvim | lua require("plugins").update()', {})
new_command('PackerSync', 'packadd packer.nvim | lua require("plugins").sync()', {})
new_command('PackerClean', 'packadd packer.nvim | lua require("plugins").clean()', {})
new_command('PackerCompile', 'packadd packer.nvim | lua require("plugins").compile()', {})
