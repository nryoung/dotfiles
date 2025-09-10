default: switch

switch: git-add
  sudo NIXPKGS_ALLOW_UNFREE=1  nixos-rebuild switch --impure --flake .#nixos

home: git-add
  home-manager switch --flake .#nic@nixos

switch-darwin: git-add
  NIXPKGS_ALLOW_UNFREE=1 sudo darwin-rebuild switch --impure --flake .#LMAC-XHQKGYJ-AG

home-darwin: git-add
  home-manager switch --flake .#NYG4@LMAC-XHQKGYJ-AG

update: git-add
  nix flake update

clean:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
  sudo nix-collect-garbage --delete-old

git-add:
  git -C $HOME/dotfiles add --all
