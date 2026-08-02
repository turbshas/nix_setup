{
    description = "My lil NixOS configy :3";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
        home-manager = {
            inputs.nixpkgs.follows = "nixpkgs";
            url = "github:nix-community/home-manager/release-26.05";
        };
        plasma-manager = {
            url = "github:nix-community/plasma-manager";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.home-manager.follows = "home-manager";
        };
    };
    outputs = inputs@{ self, nixpkgs, home-manager, plasma-manager, ... }:
    let
        system = "x86_64-linux";
        baseModules = [
            ./src/common/system_config.nix
            ./src/common/system_packages.nix
            ./src/common/desktop_environment.nix
            ./src/common/home_manager.nix
            home-manager.nixosModules.home-manager
            {
                home-manager.users.emily = ./src/common/home.nix;
                home-manager.extraSpecialArgs = { inherit inputs; };
                home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
                # Optionally, use home-manager.extraSpecialArgs to pass
                # arguments to home.nix
            }
        ];
    in
    {
        nixosConfigurations.asus-laptop = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = baseModules ++ [
                ./src/hardware/asus_laptop/asus_laptop_config.nix
            ];
        };
    };
}

