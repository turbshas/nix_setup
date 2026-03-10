{
    description = "My lil NixOS configy :3";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
        home-manager = {
            inputs.nixpkgs.follows = "nixpkgs";
            url = "github:nix-community/home-manager/release-25.11";
        };
        plasma-manager = {
            url = "github:nix-community/plasma-manager";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.home-manager.follows = "home-manager";
        };
    };
    outputs = inputs@{ self, nixpkgs, home-manager, plasma-manager, ... }: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
                ./common/system_config.nix
                ./common/system_packages.nix
                ./common/desktop_environment.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.emily = ./common/home.nix;
                    home-manager.extraSpecialArgs = { inherit inputs; };
                    home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];

                    # Optionally, use home-manager.extraSpecialArgs to pass
                    # arguments to home.nix
                }
                ./common/home_manager.nix
                ./hardware/asus_laptop_config.nix
            ];
        };
    };
}

