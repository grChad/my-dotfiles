local create_command = vim.api.nvim_create_user_command

create_command('PackerInstall', 'packadd packer.nvim | lua require("plugins").install()', {})
create_command('PackerUpdate', 'packadd packer.nvim | lua require("plugins").update()', {})
create_command('PackerSync', 'packadd packer.nvim | lua require("plugins").sync()', {})
create_command('PackerClean', 'packadd packer.nvim | lua require("plugins").clean()', {})
create_command('PackerCompile', 'packadd packer.nvim | lua require("plugins").compile()', {})
