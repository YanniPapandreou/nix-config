switch-laptop:
  /home/yanni/nix-config/check_success.sh nixos-rebuild switch --flake /home/yanni/nix-config#hp-laptop

switch-desktop:
  /home/yanni/nix-config/check_success.sh nixos-rebuild switch --flake /home/yanni/nix-config#dell-desktop

sync-neovim:
  @echo 'Syncing neovim config'
  @echo 'Cloning neovim config'
  cd /home/yanni/nix-config/home-manager/programs/editors/nvim/.config && git clone git@github.com:YanniPapandreou/nvim-config.git ./nvim
  @echo 'Moving init.lua to lua and removing git files'
  cd /home/yanni/nix-config/home-manager/programs/editors/nvim/.config/nvim && rm -rf .git && rm .gitignore && mv init.lua lua/
  @echo 'Starting to stow neovim config'
  cd ./home-manager/programs/editors && stow -t ~ nvim
  @echo 'Finished syncing'

rev-sync-neovim:
  cd /tmp && git clone git@github.com:YanniPapandreou/nvim-config.git
  cp -r /home/yanni/nix-config/home-manager/programs/editors/nvim/.config/nvim/* /tmp/nvim-config
  cd /tmp/nvim-config && mv lua/init.lua .
  cd /tmp/nvim-config && lazygit
