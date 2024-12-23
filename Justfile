default: switch

switch: git-add
  sudo nixos-rebuild switch --flake .#nixos

home: git-add
  home-manager switch --flake .#nic@nixos

update: git-add
  nix flake update

clean:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
  sudo nix-collect-garbage --delete-old

git-add:
  git -C $HOME/dotfiles add --all
