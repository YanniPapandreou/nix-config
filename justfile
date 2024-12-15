switch-laptop:
  /home/yanni/nix-config/check_success.sh nixos-rebuild switch --flake /home/yanni/nix-config#hp-laptop

switch-desktop:
  /home/yanni/nix-config/check_success.sh nixos-rebuild switch --flake /home/yanni/nix-config#dell-desktop

sync-neovim:
  @echo 'Starting to sync neovim config'
  cd ./home-manager/programs/editors && stow -t ~ nvim
  @echo 'Finished syncing'

